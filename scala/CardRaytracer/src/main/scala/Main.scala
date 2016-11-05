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
        new CardRaytracer(out).process
        val res = (System.currentTimeMillis - begin) / 1000
        err.println(s"Elapsed time : $res sec\n")
        System.exit(1)
      }

      case 1 => {
        def os = new FileOutputStream(args(0))
        new CardRaytracer(os).process
        val res = (System.currentTimeMillis - begin) / 1000
        err.println(s"Elapsed time : $res sec\n")
        os.close
        System.exit(2)
      }

      case 3 => {
        def os = new FileOutputStream(args(0))
        new CardRaytracer(os, args(1).toInt, args(2).toInt).process
        val res = (System.currentTimeMillis - begin) / 1000
        err.println(s"Elapsed time : $res sec\n")
        os.close
        System.exit(2)
      }

      case _ => {
        println("Unknown command line arguments!")
      }

    }
    System.exit(0)
  }

}
