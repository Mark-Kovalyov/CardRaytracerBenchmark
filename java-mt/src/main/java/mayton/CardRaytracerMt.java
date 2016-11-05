package mayton;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Nonnull;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.Instant;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveAction;

import static java.lang.Integer.parseInt;
import static java.lang.Integer.valueOf;
import static mayton.ConsoleUtils.*;

public class CardRaytracerMt {

    static Logger logger = LogManager.getLogger(CardRaytracerMt.class);

    static final int WIDTH  = 512;
    static final int HEIGHT = 512;

    public void prepareAndProcess(int parallelism, @Nonnull SegmentPerformer segmentPerformer, int segmentSize,
                                  @Nonnull SegmentStrategy segmentStrategy,
                                  @Nonnull String fileFormat,
                                  @Nonnull BufferedImage destImage,
                                  boolean drawSeg) throws IOException {

        logger.trace("prepareAndProcess segmentSize = {}", segmentSize);

        RecursiveAction ra = new CardRaytraceRecursiveAction(
                new Rectangle(0, 0, WIDTH, HEIGHT),
                segmentPerformer,
                segmentSize,
                segmentStrategy,
                fileFormat,
                destImage,
                drawSeg);

        ForkJoinPool pool = new ForkJoinPool(parallelism);

        pool.invoke(ra);
    }

    public static String getExtension(String filename){
        if (filename==null || filename.isEmpty()) {
            return null;
        }
        int lastIndex = filename.lastIndexOf('.');
        if (lastIndex < 0) {
            return null;
        }
        return filename.substring(lastIndex + 1);
    }

    public static void main(String[] args) throws Exception {
        Instant start = Instant.now();

        boolean drawseg = false;

        if (args.length < 5 ){
            printf("\nUsage: java -jar CardRaytracerMt-X.XX [parallelism] [segperf] [segperf] [segstr] [filename.ext] [[drawseg]]\n\n");
            printf(" Where: \n\n");
            printf("  parallelism  - Parallelism degree: {1,2,....n}, default = AvailableProcessors\n");
            printf("  segperf      - Segment performer: { QUATRO | HALF | THIRD | G_RATIO }\n");
            printf("  segstr       - Segment strategy: { HD | VD | AD }\n");
            printf("                 HD - (Horizontal division by rectangles)\n");
            printf("                 VD - (Vertial division by rectangles)\n");
            printf("                 AD - (All directions)\n");
            printf("  size         - Segment size in pixels: integer \n");
            printf("  drawseg      - Draw segment-per-thead bounding boxes (debug only)\n");
            printf("  filename.ext - Filename + extension. Where extension can be 'bmp' or 'png', always 24-bit/pixel quality\n\n");
            return;
        }

        String sparallelism  =  args[0];
        String sp            =  args[1];
        String ss            =  args[2];
        String size          =  args[3];
        String fileNameWithExt  =  args[4];

        if (args.length == 6){
            if ("drawseg".equalsIgnoreCase(args[5])) drawseg = true;
        }

        String extension = getExtension(fileNameWithExt);

        if (extension==null || !(extension.equals("png") || extension.equals("bmp"))){
            printf_err("\nInvalid file extension!\n");
            return;
        }

        int parallesism = parseInt(sparallelism);
        int segmentSize = parseInt(size);

        SegmentPerformer segmentPerformer = SegmentPerformer.decode(sp);
        SegmentStrategy  segmentStrategy  = SegmentStrategy.decode(ss);

        logger.info("Parallelism           : {} ", parallesism);
        logger.info("Segment strategy      : {} ", segmentStrategy);
        logger.info("Segment performer     : {} ", segmentPerformer);
        logger.info("Minimal segment size  : {} pixels ", segmentSize);

        BufferedImage destImage = new BufferedImage(WIDTH,HEIGHT, BufferedImage.TYPE_INT_RGB);

        CardRaytracerMt application = new CardRaytracerMt();

        application.prepareAndProcess(
                parallesism,
                segmentPerformer,
                segmentSize,
                segmentStrategy,
                extension,
                destImage,
                drawseg);

        ImageIO.write(destImage, extension.toUpperCase(),
                Files.newOutputStream(Paths.get(fileNameWithExt)));

        logger.info("Elapsed time          : {} ms", Duration.between(start,Instant.now()).toMillis());

        System.exit(1);
    }
}
