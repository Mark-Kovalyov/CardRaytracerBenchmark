extern crate num;
extern crate rand;
extern crate time;

use rand::prelude::*;

use std::env;
use std::error::Error;
use std::fs::File;
use std::io::Write;
use std::ops::*;

const WIDTH: i32 = 512;
const HEIGHT: i32 = 512;

#[derive(Copy)]
struct Vector {
	x: f64,
	y: f64,
	z: f64
}

impl Clone for Vector {
	fn clone(&self) -> Self {
		Vector { x: self.x, y: self.y, z: self.z }
	}
}

impl Add for Vector {
    type Output = Vector;

    fn add(self, rhs: Vector) -> Vector {
        Vector { x: self.x + rhs.x, y: self.y + rhs.y, z: self.z + rhs.z }
    }
}

impl Mul<f64> for Vector {
    type Output = Vector;

    fn mul(self: Vector, rhs: f64) -> Vector {
        Vector {x: self.x * rhs, y: self.y * rhs, z: self.z * rhs}
    }
}

impl Rem for Vector {
    type Output = f64;

    fn rem(self, rhs: Vector) -> f64 {
        self.x * rhs.x + self.y * rhs.y + self.z * rhs.z
    }
}

impl BitXor for Vector {
    type Output = Vector;

    fn bitxor(self, rhs: Vector) -> Vector {
        Vector {x: self.y * rhs.z - self.z * rhs.y, y: self.z * rhs.x - self.x * rhs.z, z: self.x * rhs.y - self.y * rhs.x}
    }
}

impl Not for Vector {
    type Output = Vector;

    fn not(self: Vector) -> Vector {
        self * (1.0 / (self % self).sqrt())
    }
}

static G:[i32; 9] = [
	0x0003C712,  // 00111100011100010010 
	0x00044814,  // 01000100100000010100
	0x00044818,  // 01000100100000011000
	0x0003CF94,  // 00111100111110010100
	0x00004892,  // 00000100100010010010
	0x00004891,  // 00000100100010010001
	0x00038710,  // 00111000011100010000
	0x00000010,  // 00000000000000010000
	0x00000010,  // 00000000000000010000
];

fn tracer(o: Vector, d: Vector, t: &mut f64, n:&mut Vector) -> i32 {
	*t = 1e9;
	let mut m: i32 = 0;
	let p: f64 = -o.z / d.z;
	if 0.01 < p {
		*t = p;
		*n = Vector {x: 0.0, y: 0.0, z: 1.0};
		m = 1;
	}
	let mut k: i32 = 20;
	while k != 0 {
		k = k - 1;
		let mut j: usize = 9;
		while j != 0 {
			j = j - 1;
			if (G[j] & 1 << k) != 0 {
				let p: Vector = o + Vector {x: -k as f64, y: 0.0, z: -(j as f64) - 4.0};
				let b = p % d; 
                                let c = p % p - 1.0; 
                                let q = b * b - c;
				if q > 0.0 {
					let s = -b - q.sqrt();
					if s < *t && s > 0.01 {
						*t = s; 
						*n = !(p + ((d) * (*t)));
						m = 2;
					}
				}
			}
		}
	}
	return m;
}

fn sampler(o: Vector, d: Vector, rng: &mut ThreadRng) -> Vector {
	let mut t: f64 = 0.0;
	let mut n: Vector = Vector {x: 0.0, y: 0.0, z: 0.0};
	let m: i32 = tracer(o, d, &mut t, &mut n);
	if m == 0 {
		return Vector {x: 0.7, y: 0.6, z: 1.0} * num::pow(1.0 - d.z, 4);
	}
	let mut h: Vector = o + (d * t);
        let l: Vector = !(Vector {x: 9.0 + rng.gen::<f64>(), y: 9.0 + rng.gen::<f64>(), z: 16.0} + (h * -1.0) );
        let r: Vector = d + (n * ((n % (d)) * -2.0));
	let mut b: f64 = l % n;
	if b < 0.0 || tracer(h, l, &mut t, &mut n) != 0 {
		b = 0.0;
	}
	let p: f64 = num::pow((l % r) * (if b > 0.0 {1.0} else {0.0}), 99);
	if (m & 1) != 0 {
		h = h * 0.2;
		return (
			if ((h.x.ceil() + h.y.ceil()) as i32) & 1 != 0 {
				Vector {x: 3.0, y: 1.0, z: 1.0}
			}
			else {
				Vector {x: 3.0, y: 3.0, z: 3.0}
			}
			) *
			(b * 0.2 + 0.1);
	}
	return Vector {x: p, y: p, z: p} + (sampler(h, r, rng) * 0.5);
}

fn main() {
	let mut rng: ThreadRng = thread_rng();
	let args: Vec<String> = env::args().collect();
	if args.len() == 1 {
		panic!("\n\nUsage: card-raytracer <filename>.ppm\n");
	}
	let start = time::precise_time_s();
	let mut out = match File::create(&args[1]) {
        	Err(why) => panic!("couldn't create {}: {}",
        			args[1],
        			Error::description(&why)),
	        Ok(file) => file,
	};
	write!(out,"P6 {} {} 255 ", WIDTH, HEIGHT).unwrap();
	let g: Vector = !(Vector {x: -6.0, y: -16.0, z: 0.0});
	let a: Vector = !(Vector {x: 0.0, y: 0.0, z: 1.0} ^ g) * 0.002;
	let b: Vector = !(g ^ a) * 0.002;
	let c: Vector = ((a + b) * -256.0) + g;
	let mut y: i32 = HEIGHT;
	while y != 0 {
		y = y - 1;
		let mut x: i32 = WIDTH;
		while x != 0 {
			x = x - 1;
			let mut p = Vector {x: 13.0, y: 13.0, z: 13.0};
			let mut r: i32 = 64;
			while r != 0 {
				r = r - 1;
				let t: Vector = (a * (rng.gen::<f64>() - 0.5) * 99.0) + (b * (rng.gen::<f64>() - 0.5) * 99.0);
				p = sampler(Vector {x: 17.0, y: 16.0, z: 8.0} + t, 
					!(t * -1.0 + (a * (rng.gen::<f64>() + x as f64) + b * (y as f64 + rng.gen::<f64>()) + c) * 16.0), 
					&mut rng) * 3.5 + p;
			} 
			match out.write_all(&[p.x as u8, p.y as u8, p.z as u8]) {
				Err(why) => panic!("couldn't write to {}: {}", args[1],
					Error::description(&why)),
        			Ok(_) => {},
			}
		}
	}
	println!("Time elapsed: {} s", time::precise_time_s() - start);
}
