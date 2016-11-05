class Vector(val x:Double,val y:Double,val z:Double) {

    fun plus(r:Vector) : Vector {
        return Vector(x + r.x, y + r.y, z + r.z);
    }

    // *
    fun times(r:Double) : Vector {
        return Vector(x * r, y * r, z * r);
    }

    // %
    fun mod(r:Vector) : Double {
        return x * r.x + y * r.y + z * r.z;
    }

    // ^
    fun vprod(r:Vector) : Vector {
        return Vector(y * r.z - z * r.y,
                      z * r.x - x * r.z,
                      x * r.y - y * r.x);
    }

    fun norm() : Vector {
        return this.times(1.0 / Math.sqrt(this.mod(this)));
    }

    override fun toString() : String {
        return String.format("{%d,%d,%d}",x,y,z);
    }

}