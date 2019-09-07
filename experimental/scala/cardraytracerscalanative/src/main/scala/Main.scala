package mayton.card

import mayton.card.dto.MVector

import scala.annotation.tailrec
import scala.util.Random

object Main {

  import java.io.IOException
  import java.io.PrintWriter
  
  val width = 512
  val height = 512

  val SUB_SAMPLES = 64

  // Position vectors:
  val ZERO_VECTOR = MVector(0.0, 0.0, 0.0)
  val Z_ORTHO_VECTOR = MVector(0.0, 0.0, 1.0)
  val CAMERA_ASPECT_VECTOR = MVector(17.0, 16.0, 8.0)
  val CAMERA_DEST_VECTOR = MVector(-6.0, -16.0, 0.0)

  // Color vectors:
  val COLOR_CELL1_VECTOR = MVector(3.0, 1.0, 1.0)
  val COLOR_CELL2_VECTOR = MVector(3.0, 3.0, 3.0)
  val COLOR_DARK_GRAY_VECTOR = MVector(13.0, 13.0, 13.0)
  val COLOR_SKY = MVector(0.7, 0.6, 1.0)

  val random = new Random()

  def sampler(o: MVector, d: MVector): MVector = {
    null
  }

  def tracer(o: MVector, d: MVector, t: MVector, n: MVector): Int = {
    0
  }

  @tailrec
  def pixelRoute(wr: PrintWriter, x : Int, y : Int) : Unit = {
    var p = COLOR_DARK_GRAY_VECTOR
    var r = 0
    while (r < SUB_SAMPLES) {
      //MVector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
      //val t = a.prod(Random - 0.5).prod(99.0).sum(b.prod(Random - 0.5).prod(99.0))
      //p = sampler(MVector(17, 16, 8) + t,
      //           !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
      //p = sampler(CAMERA_ASPECT_VECTOR.sum(t), t.prod(-1.0).sum(a.prod(Random + x).sum(b.prod(Random + y)).sum(c).prod(16.0)).norm).prod(3.5).sum(p)

      r += 1
    }
    val R = random.nextInt(256)
    val G = random.nextInt(256)
    val B = random.nextInt(256)
    wr.write(R)
    wr.write(G)
    wr.write(B)
    if (x < width) {
      pixelRoute(wr, x + 1, y)
    } else if (y < height) {
      pixelRoute(wr, 0, y + 1)
    }
  }

  def process(): Unit = {
    val wr = new PrintWriter("out.ppm")
    //wr.printf("P6 %d %d 255 ", width, height)
    wr.println("P6 " + width + " " + height + " 255 ")
    wr.flush()
    // MVector g = !MVector(-6, -16, 0);
    val g = !CAMERA_DEST_VECTOR
    // MVector a = !(MVector(0, 0, 1) ^ g) * .002;
    val a = !(Z_ORTHO_VECTOR ^ g) * 0.002
    // MVector b = !(g ^ a) * .002;
    val b : MVector = !(g ^ a) * 0.002
    // MVector c = (a + b) * -256 + g;
    val c : MVector = (a + b) * -256.0 + g
    var y = height - 1
    pixelRoute(wr, 0, 0)
    /*while (y >= 0) {
      var x = width - 1
      while (x >= 0) {

        x -= 1
      }
      y -= 1
    }*/
    wr.flush
  }

  def main(args: Array[String]): Unit = {
    
    process()

  }

}
