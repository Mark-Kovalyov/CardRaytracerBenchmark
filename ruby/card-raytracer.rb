WIDTH  = 512
HEIGHT = 512

class Vector
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def x
    @x
  end

  def y
    @y
  end

  def z
    @z
  end

  def +(a)
    return Vector.new(@x + a.x, @y + a.y, @z + a.z)
  end

  def *(a)
    return Vector.new(@x * a, @y * a, @z * a)
  end

  def %(a)
    return @x * a.x + @y * a.y + @z * a.z
  end

  def ^(a)
    return Vector.new(@y * a.z - @z * a.y, @z * a.x - @x * a.z,
      @x * a.y - @y * a.x)
  end

  def !()
    return self * (1.0 / Math.sqrt(self % self))
  end
end

# Position vectors:
ZERO_VECTOR = Vector.new(0.0, 0.0, 0.0)
Z_ORTHO_VECTOR = Vector.new(0.0, 0.0, 1.0)
CAMERA_ASPECT_VECTOR = Vector.new(17.0, 16.0, 8.0)
CAMERA_DEST_VECTOR = Vector.new(-6.0, -16.0, 0.0)
# Color vectors:
COLOR_CELL1_VECTOR = Vector.new(3.0, 1.0, 1.0)
COLOR_CELL2_VECTOR = Vector.new(3.0, 3.0, 3.0)
COLOR_DARK_GRAY_VECTOR = Vector.new(13.0, 13.0, 13.0)
COLOR_SKY = Vector.new(0.7, 0.6, 1.0)

G = [ 
  0x0003C712,  # 00111100011100010010
  0x00044814,  # 01000100100000010100
  0x00044818,  # 01000100100000011000
  0x0003CF94,  # 00111100111110010100
  0x00004892,  # 00000100100010010010
  0x00004891,  # 00000100100010010001
  0x00038710,  # 00111000011100010000
  0x00000010,  # 00000000000000010000
  0x00000010   # 00000000000000010000
]

class TracerOutput
  def initialize(m, t, n)
    @m = m
    @t = t
    @n = n
  end

  def m
    @m
  end

  def t
    @t
  end

  def n
    @n
  end

  def m=(m)
    @m = m
  end

  def t=(t)
    @t = t
  end

  def n=(n)
    @n = n
  end
end

def tracer(o, d, out)
  t = 1.0e9
  m = 0
  n = out.n
  p = -o.z / d.z
  if 0.01 < p
    t = p
    n = Z_ORTHO_VECTOR
    m = 1
  end
  18.downto 0 do |k|
    8.downto 0 do |j|
      if G[j] & 1 << k != 0
        p = o + Vector.new(-k.to_f, 0.0, -j.to_f - 4.0)
        b = p % d
        c = p % p - 1
        q = b * b - c
        if q > 0.0
          s = -b - Math.sqrt(q)
          if s < t && s > 0.01
            t = s
            n = !(p + d * t)
            m = 2
          end
        end
      end
    end
  end
  out.m = m
  out.t = t
  out.n = n
end

def sampler(o, d)
  t = 0.0
  n = ZERO_VECTOR
  m = 0
  out = TracerOutput.new(m, t, n)
  tracer(o, d, out)
  m = out.m
  t = out.t
  n = out.n
  if m == 0
    return COLOR_SKY * ((1.0 - d.z) ** 4)
  end
  h = o + d * t
  l = !(Vector.new(9.0 + rand, 9.0 + rand, 16.0) + h * -1.0)
  r = n

  b = l % n
  if b < 0.0
    b = 0.0
  else
    m1 = 0
    out = TracerOutput.new(m1, t, n)
    tracer(h, l, out)
    m1 = out.m
    t = out.t
    n = out.n
    if m1 != 0
      b = 0.0
    end
  end

  if m == 1
    return (((h.x * 0.2).ceil + (h.y * 0.2).ceil).to_i & 1 != 0 ? 
      COLOR_CELL1_VECTOR : COLOR_CELL2_VECTOR) * (b * 0.2 + 0.1)
  end

  r = d + r * (r % d * -2.0)
  p = (b > 0.0) ? ((l % r) ** 99) : 0.0
  return Vector.new(p, p, p) + sampler(h, r) * 0.5
end


if ARGV.empty?
  STDERR.puts "\n\nUsage: card-raytracer <filename>.ppm\n"
  exit -1
end
File.open(ARGV[0], "w") do |out|
  out.printf("P6 %d %d 255 ", WIDTH, HEIGHT)
  g = !CAMERA_DEST_VECTOR
  a = !(Z_ORTHO_VECTOR ^ g) * 0.002
  b = !(g ^ a) * 0.002
  c = (a + b) * -256.0 + g
  (HEIGHT-1).downto 0 do |y|
    (WIDTH-1).downto 0 do |x|
      p = COLOR_DARK_GRAY_VECTOR
      63.downto 0 do |r|
        t = a * (rand - 0.5) * 99.0 + b * (rand - 0.5) * 99.0
        p = p + sampler(
          CAMERA_ASPECT_VECTOR + t,
          !(t * -1.0 + (a * (rand + x) + b * (y + rand) + c) * 16.0)
          ) * 3.5
      end
      out.print p.x.to_i.chr, p.y.to_i.chr, p.z.to_i.chr
    end
  end
end
