import java.awt.image.BufferedImage
import java.io
import java.io.{OutputStream, PrintWriter}
import java.lang.Math._
import java.nio.file.{Files, Paths}
import javax.imageio.ImageIO

/**
  * Special thanks to Paul Heckbert
  * <p/>
  * http://tproger.ru/translations/business-card-raytracer
  * <p/>
  * Scala port (from Java to Scala)
  * <p/>
  * 2-MAR-2016 - (mayton) In beginning...
  * 3-MAR-2016 - (mayton) Bug in printf has been fixed.
  *              (mayton) Source code has been refactored into multiple modules
  * 4-MAR-2016 - (mayton) Constants has been optimized.
  *              (mayton) Constants with 'Conpanion object' has been introduced (thnx to Usman)
  * 5-MAR-2015 - (mayton) Local Namespace CardRaytracer has been introduced (thnx to Usman)
  *              (mayton) Implicit conversation function for Binary -> Int has been added
  *              (mayton) Loop expressions has been refactored
  *              (mayton) Loop exp. 'to' refactored with 'until'
  *              (mayton) Redundant syntax has been removed
  * 9-MAR-2015   (mayton) Fix bug in main function (thnx to avp.mk)
  */
object CardRaytracer {

  val WIDTH       = 512
  val HEIGHT      = 512
  val SUB_SAMPLES = 64

  implicit class IntToBase( val digits:String ) extends AnyVal {
    def base(b:Int) = Integer.parseInt( digits, b )
    def b = base(2)
    def o = base(8)
    def x = base(16)
  }

}

import CardRaytracer._

class CardRaytracer(outputStream_arg:io.OutputStream, width_arg:Int, height_arg:Int) {

    var     outputStream:OutputStream    = outputStream_arg
    lazy val printWriter:PrintWriter     = new PrintWriter(outputStream)

    var width:  Int      = width_arg
    var height: Int      = height_arg

    // Position vectors:
    val ZERO_VECTOR            = new Vector(0.0,0.0,0.0)
    val Z_ORTHO_VECTOR         = new Vector(0.0,0.0,1.0)
    val CAMERA_ASPECT_VECTOR   = new Vector(17.0, 16.0, 8.0)
    val CAMERA_DEST_VECTOR     = new Vector(-6.0, -16.0, 0.0)

    // Color vectors:
    val COLOR_CELL1_VECTOR     = new Vector(3.0, 1.0, 1.0)
    val COLOR_CELL2_VECTOR     = new Vector(3.0, 3.0, 3.0)
    val COLOR_DARK_GRAY_VECTOR = new Vector(13.0, 13.0, 13.0)
    val COLOR_SKY              = new Vector(0.7, 0.6, 1.0)

    val G = Array(
      "00111100011100010010".b,
      "01000100100000010100".b,
      "01000100100000011000".b,
      "00111100111110010100".b,
      "00000100100010010010".b,
      "00000100100010010001".b,
      "00111000011100010000".b,
      "00000000000000010000".b,
      "00000000000000010000".b
    )

    val M    = 1048576 // 2^20
    val J    = 2045

    var oldI = 12357

    def Random() : Double = {
        oldI = (oldI * J + 1) % M
        (oldI / M).toDouble
    }

    def tracer(o:Vector,d:Vector,t:DoubleBox,n:VectorBox) : Int = {

        t.value      = 1e9
        var m:Int    = 0
        var p:Double = -o.z / d.z

        if (0.01 < p) {
          t.value = p
          n.value = Z_ORTHO_VECTOR
          m = 1
        }

        for (k <- (0 to 18).reverse ; j <- (0 to 8).reverse; if (G(j) & 1 << k) != 0) {
          var p: Vector = o + new Vector(-k, 0.0, -j - 4.0)
          var b: Double = p % d
          var c: Double = p % p - 1.0
          var q: Double = b * b - c
          if (q > 0) {
            var s: Double = -b - sqrt(q)
            if (s < t.value && s > 0.01) {
              t.value = s
              n.value = !(p + d * t.value)
              m = 2
            }
          }
        }
        m
    }

    // TODO:  at scala.collection.immutable.Range.foreach$mVc$sp(Range.scala:161)
    // TODO:  at CardRaytracer.tracer(CardRaytracer.scala:97)

  def sampler(o: Vector,d: Vector):Vector = {

        //wr.println(s"sampler : o = $o, d = $d")
        //wr.flush

        var t:DoubleBox = new DoubleBox(0.0)
        var n:VectorBox = new VectorBox(ZERO_VECTOR)
        var m:Int = tracer(o, d, t, n)

        if (m == 0) {
          return COLOR_SKY * pow(1.0 - d.z, 4.0)
        }

        var h:Vector = o + d * t.value

        var l:Vector = !(new Vector(9 + Random, 9 + Random, 16) + h * -1)

        var r:Vector = d + n.value * (n.value % d * -2)

        var b:Double = l % n.value

        if (b < 0 || tracer(h, l, t, n) != 0) {
            b = 0
        }

        var p:Double = pow(l % r * (if (b > 0) 1.0 else 0.0), 99.0)

        if ((m & 1) != 0) {
            h = h * 0.2
            if (((ceil(h.x) + ceil(h.y)).toInt & 1) !=0 )
                return COLOR_CELL1_VECTOR
            else
                return COLOR_CELL2_VECTOR * (b * 0.2 + 0.1)
        }

        return new Vector(p, p, p) + sampler(h, r) * 0.5
    }

    def this(stream_arg:OutputStream) {
        this(stream_arg,WIDTH,HEIGHT)
    }

  def alignByte(a:Int) : Int = {
    min(max(a, 0),255)
  }

  def process() {
    val image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB)
    var g: Vector = !CAMERA_DEST_VECTOR
    var a: Vector = !(Z_ORTHO_VECTOR ^ g) * .002
    var b: Vector = !(g ^ a) * .002
    var c: Vector = (a + b) * -256.0 + g
    var cnt:Int = 0
    for (y <- (0 until height).reverse; x <- (0 until width).reverse) {
      var p: Vector = COLOR_DARK_GRAY_VECTOR
      for (r <- 0 until SUB_SAMPLES) {
        var t: Vector = a * (Random - 0.5) * 99.0 + b * (Random - 0.5) * 99.0
        p = sampler(
          CAMERA_ASPECT_VECTOR + t,
          !(t * -1 + (a * (Random + x) + b * (y + Random) + c) * 16)
        ) * 3.5 + p
      }
      var R: Int = alignByte(p.x.toInt)
      var G: Int = alignByte(p.y.toInt)
      var B: Int = alignByte(p.z.toInt)
      image.setRGB(width - x - 1, height - y - 1, 0xFF000000 | R << 16 | G << 8 | B )
    }
    ImageIO.write(image, "PNG", Files.newOutputStream(Paths.get("out.png")))
  }

}
