program card_raytracer10;

// Uses Delphi 10 operator overloading

{$APPTYPE CONSOLE}
uses
  Math;

const
  Width = 512;
  Height = 512;

  M = 1048576; // 2^20
  J = 2045;
var
  oldI: integer = 12357;
type
  TFloat = double;

  (*
  TVector = record
    case integer of
      0: (x, y, z: TFloat;);
      1: (vector: array[1..3] of TFloat;);
  end;*)

  TVector = record
  public
      x, y, z: TFloat;
      constructor Create(a, b, c: TFloat);
      class operator Add(const [Ref] v1, v2: TVector): TVector;
      class operator Multiply(const [Ref] v: TVector; r: TFloat): TVector;
      class operator Multiply(const [Ref] v1, v2: TVector): TFloat;
      class operator LogicalNot(const [Ref] v: TVector): TVector;
      class operator LogicalXor(const [Ref] v1, v2: TVector): TVector;
  end;

  function rand0_1(): TFloat; inline;
  begin
    oldI := (oldI * J + 1) mod M;
    Result := oldI / M;
  end;

  constructor TVector.Create(a, b, c: TFloat);
  begin
    x := a;
    y := b;
    z := c;
  end;

 class operator TVector.Add(const [Ref] v1, v2: TVector): TVector;
  begin
    Result := TVector.Create(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z);
  end;
 (*
  operator -(const v1, v2: TVector): TVector;
  begin
    Result := Vector(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z);
  end;

  operator -(const v: TVector): TVector;
  begin
    Result := Vector(-v.x, -v.y, -v.z);
  end;
  *)
  class operator TVector.Multiply(const [Ref] v: TVector; r: TFloat): TVector;
  begin
    Result := TVector.Create(v.x * r, v.y * r, v.z * r);
  end;

  class operator TVector.Multiply(const [Ref] v1, v2: TVector): TFloat;
  begin
    Result := v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
  end;

  class operator TVector.LogicalXor(const [Ref] v1, v2: TVector): TVector;
  begin
    Result := TVector.Create(v1.y * v2.z - v1.z * v2.y, v1.z * v2.x -
      v1.x * v2.z, v1.x * v2.y - v1.y * v2.x);
  end;

  class operator TVector.LogicalNot(const [Ref] v: TVector): TVector;
  var
    r: TFloat;
  begin
    r := sqrt(v * v);
    Result := v * (1 / r);
  end;

const
  Gt: array[0..8] of integer = (
    $0003C712,  // 00111100011100010010
    $00044814,  // 01000100100000010100
    $00044818,  // 01000100100000011000
    $0003CF94,  // 00111100111110010100
    $00004892,  // 00000100100010010010
    $00004891,  // 00000100100010010001
    $00038710,  // 00111000011100010000
    $00000010,  // 00000000000000010000
    $00000010  // 00000000000000010000
    );

  function tracer(const [Ref] o, d: TVector; out t: Tfloat; out n: TVector): integer;
  var
    k, j: integer;
    pp: TFloat;
    p: TVector;
    b: TFloat;
    c, q, s: TFloat;
  begin
    t := 1e9;
    Result := 0;
    pp := -o.z / d.z;
    if (0.01 < pp) then
    begin
      t := pp;
      n := TVector.Create(0, 0, 1);
      Result := 1;
    end;
    for k := 18 downto 0 do
    begin
      for j := 8 downto 0 do
      begin
        if (Gt[j] and (1 shl k)) = 0 then
          continue;
        p := o + TVector.Create(-k, 0, -(j + 4));
        b := p * d;
        c := p * p - 1;
        q := b * b - c;
        if (q <= 0) then
          continue;
        s := -b - sqrt(q);
        if (s < t) and (s > 0.01) then
        begin
          t := s;
          n := not (p + d * t);
          Result := 2;
        end;
      end;
    end;
  end;

  function sampler(const [Ref] o, d: TVector): TVector;
  var
    t: TFloat;
    n: TVector;
    m: integer;
    h, l, r, s: TVector;
    b, p: TFloat;
    p1, p2: TFloat;
  begin

    m := tracer(o, d, t, n);
    if (m = 0) then
      Exit(TVector.Create(0.7, 0.6, 1) * power(1 - d.z, 4));

    h := o + d * t;
    p2 := 9 + rand0_1();
    p1 := 9 + rand0_1();
    l := not (TVector.Create(p1, p2, 16) + h * -1);
    r := d + n * (n * d * (-2));
    b := l * n;
    if (b < 0) or (tracer(h, l, t, n) <> 0) then
      b := 0;

    p := power(l * r, 99) * Ord(b > 0);
    if (m and 1) <> 0 then
    begin
      h := h * 0.2;
      if ((ceil(h.x) + ceil(h.y)) and 1) <> 0 then
      begin
        s := TVector.Create(3, 1, 1);
      end
      else
      begin
        s := TVector.Create(3, 3, 3);
      end;
      Exit(s * (b * 0.2 + 0.1));
    end
    else
    begin
      Result := TVector.Create(p, p, p) + sampler(h, r) * 0.5;
    end;
  end;

var
  g, a, b, c, p, t, ta, tb: TVector;
  y, x, r: integer;
begin
  writeln('P6');
  //writeln('P3');
  writeln(Width, ' ', Height);
  Write('255 ');
  g := not TVector.Create(-6, -16, 0);
  a := (not (TVector.Create(0, 0, 1) xor g)) * 0.002;
  b := (not (g xor a)) * 0.002;
  c := (a + b) * (-256) + g;
  for y := Height - 1 downto 0 do
  begin
    ;
    for x := Width - 1 downto 0 do
    begin
      p := TVector.Create(13, 13, 13);
      for r := 64 downto 1 do
      begin
        tb := b * ((rand0_1() - 0.5) * 99);
        ta := a * ((rand0_1() - 0.5) * 99);
        t := ta + tb;
        p := sampler(TVector.Create(17, 16, 8) + t,
          not (t * (-1) + (a * (rand0_1() + x) + b * (y + rand0_1()) + c) * 16)) *
          3.5 + p;
      end;
      //writeln(min(round(p.x),255),' ',min(round(p.y),255),' ',min(round(p.z),255));
      Write(char(round(p.x)), char(round(p.y)), char(round(p.z)));
    end;
  end;
end.

