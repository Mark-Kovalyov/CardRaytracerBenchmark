package mayton;

import javax.annotation.concurrent.Immutable;

import static java.lang.Math.sqrt;

/**
 * Represents triple of floating-point numbers.
 */
@Immutable
public final class Vector {

    public final double x;
    public final double y;
    public final double z;

    public Vector(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public Vector sum(Vector r) {
        return new Vector(x + r.x, y + r.y, z + r.z);
    }

    public Vector prod(double r) {
        return new Vector(x * r, y * r, z * r);
    }

    public double sprod(Vector r) {
        return x * r.x + y * r.y + z * r.z;
    }

    public Vector vprod(Vector r) {
        return new Vector(y * r.z - z * r.y,
                z * r.x - x * r.z,
                x * r.y - y * r.x);
    }

    public Vector norm() {
        return this.prod(1.0 / sqrt(this.sprod(this)));
    }

}

