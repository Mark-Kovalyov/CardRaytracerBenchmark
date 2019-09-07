package mayton.card.dto

import java.lang.Math._

case class MVector(val x: Double,val y: Double,val z: Double) {

  def this() {
    this(0.0, 0.0, 0.0)
  }

  def +(r: MVector): MVector = {
    MVector(x + r.x, y + r.y, z + r.z)
  }

  def *(r: Double): MVector = {
    MVector(x * r, y * r, z * r)
  }

  def %(r: MVector): Double = {
    x * r.x + y * r.y + z * r.z
  }

  def ^(r: MVector): MVector = {
    MVector(y * r.z - z * r.y,
      z * r.x - x * r.z,
      x * r.y - y * r.x)
  }

  def unary_! : MVector = this * (1.0/sqrt(this % this))

  override def toString() : String = s"{$x,$y,$z}"

}

