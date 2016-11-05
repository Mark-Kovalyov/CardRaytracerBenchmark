package main

import (
	"fmt"
	"math"
	"math/rand"
	"os"
)

type Vector struct {
	X float64
	Y float64
	Z float64
}

func (l Vector) sum(r Vector) Vector {
	return Vector{l.X + r.X, l.Y + r.Y, l.Z + r.Z}
}

func (l Vector) prod(r float64) Vector {
	return Vector{l.X * r, l.Y * r, l.Z * r}
}

func (l Vector) sprod(r Vector) float64 {
	return l.X * r.X + l.Y * r.Y + l.Z * r.Z
}

func (l Vector) vprod(r Vector) Vector {
	return Vector{
		l.Y * r.Z - l.Z * r.Y,
		l.Z * r.X - l.X * r.Z,
		l.X * r.Y - l.Y * r.X,
	}
}

func (l Vector) norm() Vector {
	var fix = 1 / math.Sqrt(
		l.X * l.X +
		l.Y * l.Y +
		l.Z * l.Z)

	return Vector{l.X * fix, l.Y * fix, l.Z * fix}
}

var G = []uint{
	0x0003C712,  // 00111100011100010010
	0x00044814,  // 01000100100000010100
	0x00044818,  // 01000100100000011000
	0x0003CF94,  // 00111100111110010100
	0x00004892,  // 00000100100010010010
	0x00004891,  // 00000100100010010001
	0x00038710,  // 00111000011100010000
	0x00000010,  // 00000000000000010000
	0x00000010,  // 00000000000000010000
}

func tracer(o Vector, d Vector, n *Vector, t *float64) int {
	*t = 1e9
	var m = 0
	var p = -o.Z / d.Z

	if .01 < p {
		*t = p
		*n = Vector{0, 0, 1}
		m = 1
	}

	for k := 18; k >= 0; k-- {
		for j := 8; j >= 0; j-- {
			if 0 != (G[uint(j)] & (1 << uint(k))) {
				var p = o.sum(Vector{float64(-k), 0, float64(-j - 4)})
				var b = p.sprod(d)
				var c = p.sprod(p) - 1
				var q = b * b - c
				if q > 0 {
					var s = -b - math.Sqrt(q)
					if (s < *t) && (s > .01) {
						*t = s
						*n = p.sum(d.prod(*t)).norm()
						m = 2
					}
				}
			}
		}
	}

	return m
}

func sampler(o Vector, d Vector) Vector {
	var t float64
	var n Vector

	var m = tracer(o, d, &n, &t);

	if m == 0 {
		return Vector{.7, .6, 1}.prod(math.Pow(1 - d.Z, 4))
	}

	var h = o.sum(d.prod(t))
	var l = Vector{9 + rand.Float64(), 9 + rand.Float64(), 16}.sum(h.prod(-1)).norm()
	var r = d.sum(n.prod(n.sprod(d) * -2))

	var b = l.sprod(n)
	if b < 0 || tracer(h, l, &n, &t) != 0 {
		b = 0
	}

	if m == 1 {
		h = h.prod(.2)
		if 1 == (1 & uint(math.Ceil(h.X) + math.Ceil(h.Y))) {
			return Vector{3, 1, 1}.prod(b * .2 + .1)
		}
		return Vector{3, 3, 3}.prod(b * .2 + .1)
	}

	var p = .0
	if b > 0 {
		p = math.Pow(l.sprod(r), 99)
	}

	if b > 0 {
		return Vector{p, p, p}.sum(sampler(h, r).prod(.5))
	}

	return Vector{0, 0, 0}.sum(sampler(h, r).prod(.5))
}

func main() {
	var g = Vector{-6, -16, 0}.norm()
	var a = Vector{0, 0, 1}.vprod(g).norm().prod(.002)
	var b = g.vprod(a).norm().prod(.002)
	var c = a.sum(b).prod(-256).sum(g)

	fmt.Printf("P6 %d %d 255 ", 512, 512);

	var x, y, r int
	for y = 511; y >= 0; y-- {
		for x = 511; x >= 0; x-- {
			var p = Vector{13, 13, 13}
			for r = 63; r >= 0; r-- {
				var t = a.prod((rand.Float64() - .5) * 99).sum(b.prod((rand.Float64() - .5) * 99))
				p = sampler(Vector{17, 16, 8}.sum(t), t.prod(-1).sum(a.prod(rand.Float64() + float64(x)).sum(b.prod(rand.Float64() + float64(y))).sum(c).prod(16)).norm()).prod(3.5).sum(p)
			}

			os.Stdout.Write([]byte{byte(uint(p.X)), byte(uint(p.Y)), byte(uint(p.Z))});
		}
	}
}
