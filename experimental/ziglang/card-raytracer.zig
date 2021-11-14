const std = @import("std");

/// 12-Nov-2021 - mayton : In beginning...

const WIDTH = 512;
const HEIGHT = 512;
const SUB_SAMPLES = 64;


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

    pub fn plus(self: Vector, that: Vector) Vector {
        return Vector { self.x + that.x, self.y + that.y, self.z + that.z };
    }

    pub fn vprod(self: Vector, r: Vector) Vector {
        return Vector {
                self.y * r.z - self.z * r.y,
                self.z * r.x - self.x * r.z,
                self.x * r.y - self.y * r.x };
    }

    pub fn norm(self: Vector) Vector {
      return self.prod(1.0 / @sqrt(self.sprod(self)));
    }

    pub fn prod(self: Vector, r: f64) Vector {
        return Vector.init(self.x * r, self.y * r, self.z * r);
    }

    pub fn sprod(self: Vector, that: Vector) f64 {
        return self.x * that.x + self.y * that.y + self.z * that.z;
    }
};

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
  // ....
  return 0;
}

pub fn sampler(o : Vector, d: Vector) Vector {
  // ....
  return Vector.init(0,0,0);
}

pub fn process() void {
  var g: Vector = CAMERA_DEST_VECTOR.norm();
  var y : i32 = HEIGHT - 1;
  var x : i32 = WIDTH - 1;
  while (y >= 0) {
    while (x >= 0) {
      var p : Vector = COLOR_DARK_GRAY_VECTOR;
      var r : i32 = 0;
      while (r < SUB_SAMPLES) {
        const red   = @floatToInt(i32, p.x);
        const green = @floatToInt(i32, p.y);
        const blue  = @floatToInt(i32, p.z);
        const stdout = std.io.getStdOut().writer();

        // ./card-raytracer.zig:93:9: error: expected type 'void', found 'std.os.WriteError'
        // try stdout.print("Hello, {s}!\n", .{"world"});
        
        try stdout.print("Hello, {s}!\n", .{"world"});
        r = r + 1;
      }
    }
    y = y - 1;
  }
}

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  try stdout.print("P6 {} {} 255", .{WIDTH, HEIGHT});
  process();
}
