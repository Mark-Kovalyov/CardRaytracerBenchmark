<?php

const WIDTH = 512;
const HEIGHT = 512;

final class Vector {
	public $x = .0;
	public $y = .0;
	public $z = .0;

	public function __construct($a, $b, $c) {
		$this->x = $a;
		$this->y = $b;
		$this->z = $c;
	}

	public function sum($r) {
		return new Vector($this->x + $r->x, $this->y + $r->y, $this->z + $r->z);
	}

	public function prod($r) {
		return new Vector($this->x * $r, $this->y * $r, $this->z * $r);
	}

	public function sprod($r) {
		return $this->x * $r->x + $this->y * $r->y + $this->z * $r->z;
	}

	public function vprod($r) {
		return new Vector(
			$this->y * $r->z - $this->z * $r->y,
			$this->z * $r->x - $this->x * $r->z,
			$this->x * $r->y - $this->y * $r->x
		);
	}

	public function norm() {
		$fix = 1 / sqrt(
			$this->x * $this->x +
			$this->y * $this->y +
			$this->z * $this->z
		);

		return new Vector($this->x * $fix, $this->y * $fix, $this->z * $fix);
	}
}

$G = [
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

$RANDMAX = getrandmax();

function rnd() {
	global $RANDMAX;
	return rand() / $RANDMAX;
}

$v0 = new Vector(0, 0, 1);

function tracer($o, $d, &$n, &$t) {
	global $v0, $G;

	$t = 1e9;
	$m = 0;
	$p = -$o->z / $d->z;

	if (.01 < $p) {
		$t = $p;
		$n = $v0;
		$m = 1;
	}

	for ($k = 19; $k--;) {
		for ($j = 9; $j--;) {
			if ($G[$j] & 1 << $k) {
				$p = $o->sum(new Vector(-$k, 0, -$j - 4));
				$b = $p->sprod($d);
				$c = $p->sprod($p) - 1;
				$q = $b * $b - $c;
				if ($q > 0) {
					$s = -$b - sqrt($q);
					if (($s < $t) && ($s > .01)) {
						$t = $s;
						$n = $p->sum($d->prod($t))->norm();
						$m = 2;
					}
				}
			}
		}
	}
	return $m;
}

$v1 = new Vector(.7, .6, 1);
$v2 = new Vector(3, 1, 1);
$v3 = new Vector(3, 3, 3);
$v4 = new Vector(0, 0, 0);

function sampler($o, $d) {
	global $v1, $v2, $v3, $v4;

	$t = 0;
	$n = null;

	$m = tracer($o, $d, $n, $t);
	if (!$m) {
		return $v1->prod(pow(1 - $d->z, 4));
	}

	$h = $o->sum($d->prod($t));
	$l = (new Vector(9 + rnd(), 9 + rnd(), 16))->sum($h->prod(-1))->norm();
	$r = $d->sum($n->prod($n->sprod($d) * -2));

	$b = $l->sprod($n);
	if ($b < 0 || tracer($h, $l, $n, $t)) {
		$b = 0;
	}

	if ($m & 1) {
		$h = $h->prod(.2);
		$olo = (((int)(ceil($h->x) + ceil($h->y)) & 1)
			? $v2
			: $v3
		);
		return $olo->prod($b * .2 + .1);
	}

	$p = ($b > 0) ? pow($l->sprod($r), 99) : 0;

	$olo = (($b > 0) ? new Vector($p, $p, $p) : $v4);
	return $olo->sum(sampler($h, $r)->prod(.5));
}

$v5 = new Vector(13, 13, 13);
$v6 = new Vector(17, 16, 8);

function main() {
	global $v5, $v6;

	printf('P6 %d %d 255 ', WIDTH, HEIGHT);

	$g = (new Vector(-6, -16, 0))->norm();
	$a = (new Vector(0, 0, 1))->vprod($g)->norm()->prod(.002);
	$b = $g->vprod($a)->norm()->prod(.002);
	$c = $a->sum($b)->prod(-256)->sum($g);

	for ($y = HEIGHT; $y--;) {
		for ($x = WIDTH; $x--;) {
			$p = $v5;
			for ($r = 64; $r--;) {
				$t = $a->prod((rnd() - .5) * 99)->sum($b->prod((rnd() - .5) * 99));

				$p = sampler($v6->sum($t),
					$t->prod(-1)->sum($a->prod(rnd() + $x)->sum($b->prod(rnd() + $y))->sum($c)->prod(16))->norm()
				)->prod(3.5)->sum($p);
			}
			printf('%c%c%c', $p->x, $p->y, $p->z);
		}
	}
}

main();

?>
