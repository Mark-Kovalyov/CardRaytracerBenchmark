import java.io.FileOutputStream
import java.io.OutputStream
import java.lang.System.err

fun main(args: Array<String>) {
    val begin: Long = System.currentTimeMillis()
    when (args.size) {
        0 -> {
            CardRaytracer(System.out).process();
            err.printf("Elapsed time : %d sec\n", (System.currentTimeMillis() - begin) / 1000);
            System.exit(1);
        }
        1 -> {
            var os: OutputStream = FileOutputStream(args[0]); //("img/image1.ppm");
            CardRaytracer(os).process();
            os.close();
            err.printf("Elapsed time : %d sec\n", (System.currentTimeMillis() - begin) / 1000);
            System.exit(1);
        }
        3 -> {
            var os: OutputStream = FileOutputStream(args[0]);
            CardRaytracer(os, args[1].toInt(), args[2].toInt()).process();
            os.close();
            err.printf("Elapsed time : %d sec\n", (System.currentTimeMillis() - begin) / 1000);
            System.exit(2);
        }
    }
    System.exit(0);
}