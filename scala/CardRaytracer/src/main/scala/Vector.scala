import java.lang.Math._

class Vector(val x: Double,val y: Double,val z: Double) {

  def this() {
    this(0.0, 0.0, 0.0)
  }

  def +(r: Vector): Vector = {
    new Vector(x + r.x, y + r.y, z + r.z)
  }

  def *(r: Double): Vector = {
    new Vector(x * r, y * r, z * r)
  }

  def %(r: Vector): Double = {
    x * r.x + y * r.y + z * r.z
  }

  def ^(r: Vector): Vector = {
    new Vector(y * r.z - z * r.y,
      z * r.x - x * r.z,
      x * r.y - y * r.x)
  }

  def unary_! : Vector = this * (1.0/sqrt(this % this))

  override def toString() : String = s"{$x,$y,$z}"

}

