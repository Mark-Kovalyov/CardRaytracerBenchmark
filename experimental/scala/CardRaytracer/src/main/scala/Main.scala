import java.io.{OutputStream, PrintWriter, FileOutputStream}
import System.out
import System.err
import java.util.Random

/**
  * Main
  *
  * 5-MAR-2015 - (mayton) 'if-else' codeblock has been refactored with 'match'
  */
object Main {

  def main(args: Array[String]): Unit = {
    val begin = System.currentTimeMillis

    args.length match {

      case 0 => {
        err.println(s"Usage: java -jar CardRaytracer-X.XX filename.ext\n")
        err.println(s"Where:\n")
        err.println(s"  filename.ext - Filename + extension. Where extension can be 'bmp' or 'png', always 24-bit/pixel quality\n\n")
        System.exit(1)
      }

      case 1 => {
        new CardRaytracer().process
        val res = (System.currentTimeMillis - begin) / 1000
        err.println(s"Elapsed time : $res sec\n")
        System.exit(2)
      }

      case _ => {
        println("Unknown command line arguments!")
      }

    }
    System.exit(0)
  }

}
