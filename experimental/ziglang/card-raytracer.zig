const std = @import("std");

/// 12-Nov-2021 - mayton : In beginning...

const WIDTH = 512;
const HEIGHT = 512;

const Vector = struct {
    x: f64,
    y: f64,
    z: f64,

    pub fn init(x: f64, y: f64, z: f64) Vector {
      return Vector {
        .x = x,
        .y = y,
        .z = z
      };
    }

    pub fn plus(that: Vector) Vector {
        return Vector { .x + that.x, .y + that.y, .z + that.z };
    }

    pub fn vprod(r: Vector) Vector {
        return Vector {
                .y * r.z - .z * r.y,
                .z * r.x - .x * r.z,
                .x * r.y - .y * r.x };
    }

    pub fn norm() Vector {
      return @This.prod(1.0 / @sqrt(@This.sprod(@This)));
    }

    pub fn prod(r: f64) Vector {
        return Vector.init(@This().x * r, @This().y * r, @This().z * r);
    }
};

//fn plus(this: Vector, that: Vector) Vector {
//return Vector.init(this.x + that.x, this.y + that.y, this.z + that.z);
//}

//fn prod(this: Vector, r: f64) Vector {
//    return Vector.init(this.x * r, this.y * r, this.z * r);
//}

//fn sprod(this: Vector, that: Vector) f64 {
//    return this.x * that.x + this.y * that.y + this.z + that.z;
//}

//fn vprod(this: Vector, r: Vector) Vector {
    //return Vector.init(
            //this.y * r.z - this.z * r.y,
            //this.z * r.x - this.x * r.z,
            //this.x * r.y - this.y * r.x);
//}

//fn norm(this : Vector) Vector {
//  const sp : f64 = sprod(this, this);
//  const temp : f64 = @sqrt(sp);
//  return prod(this, 1.0 / temp);
//}

const G = [_] i32 {
  0x0003C712,
  0x00044814,
  0x00044818,
  0x0003CF94,
  0x00004892,
  0x00004891,
  0x00038710,
  0x00000010,
  0x00000010
};

const ZERO_VECTOR = Vector.init(0.0, 0.0, 0.0);
const Z_ORTHO_VECTOR = Vector.init(0, 0, 1);
const CAMERA_ASPECT_VECTOR = Vector.init(17, 16, 8);
const CAMERA_DEST_VECTOR = Vector.init(-6.0, -16.0, 0.0);

const COLOR_CELL1_VECTOR = Vector.init(3, 1, 1);
const COLOR_CELL2_VECTOR = Vector.init(3, 3, 3);
const COLOR_DARK_GRAY_VECTOR = Vector.init(13, 13, 13);
const COLOR_SKY = Vector.init(0.7, 0.6, 1);

// TODO: Pass n by ref to return
pub fn tracer(o : Vector, d : Vector, t : f64, n : Vector) i32 {
  return 0;
}

pub fn sampler(o : Vector, d: Vector) Vector {
  return Vector.init(0,0,0);
}

pub fn process() void {
  var g = CAMERA_DEST_VECTOR.norm();
  var a = Z_ORTHO_VECTOR.vprod(g);
  var a2 = a.norm();
  var a3 = a2.prod(0.002);
}

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  try stdout.print("P6 {} {} 255", .{WIDTH, HEIGHT});
  process();
}
