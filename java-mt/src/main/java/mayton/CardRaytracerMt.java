package mayton;

import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.ParseException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Nonnull;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.Instant;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveAction;

import static java.lang.Integer.parseInt;
import static mayton.ConsoleUtils.*;
import static org.apache.commons.lang3.StringUtils.isEmpty;

public class CardRaytracerMt {

    static Logger logger = LogManager.getLogger(CardRaytracerMt.class);

    static final int WIDTH  = 512;
    static final int HEIGHT = 512;

    public void prepareAndProcess(int parallelism, @Nonnull SegmentPerformer segmentPerformer, int segmentSize,
                                  @Nonnull SegmentStrategy segmentStrategy,
                                  @Nonnull String fileFormat,
                                  @Nonnull BufferedImage destImage,
                                  boolean drawSeg) {

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
        if (isEmpty(filename)) {
            return null;
        }
        int lastIndex = filename.lastIndexOf('.');
        if (lastIndex < 0) {
            return null;
        }
        return filename.substring(lastIndex + 1);
    }

    public static Options prepareOptions() {
        return new Options()
                .addOption(new Option("h", "help", false, "print this message" ))
                .addOption(new Option("p", "parallelism", true, "parallelism degree: {-,1,2,....n}, " +
                        "default = AvailableProcessors)"))
                .addOption(new Option("s", "segperf", true, "segment performer: { QUATRO | HALF | THIRD | G_RATIO }"))
                .addOption(new Option("ss", "segstr", true, "segment strategy: { HD | VD | AD }, " +
                        "HD - (horizontal division by rectangles), " +
                        "VD - (vertial division by rectangles), " +
                        "AD - (all directions)"))
                .addOption("sz","segmentsize", true, "segment size in pixels: integer")
                .addOption("d","drawseg", false, "draw segment-per-thead bounding boxes (debug only)")
                .addOption("f","filename", true, "filename + extension, where extension can be 'bmp' or 'png', " +
                        "always 24-bit/pixel quality or /dev/null to omit file creation.");
    }

    public static void printHelp(Options options) {
        HelpFormatter formatter = new HelpFormatter();
        formatter.printHelp("CardRaytracerMt", options);
    }

    public static void process(CommandLine commandLine) throws IOException {

        boolean drawseg;

        String sparallelism  =  commandLine.getOptionValue("p");
        String sp            =  commandLine.getOptionValue("s");
        String ss            =  commandLine.getOptionValue("ss");
        String size          =  commandLine.getOptionValue("sz");
        String fileNameWithExt = commandLine.getOptionValue("f");

        drawseg = commandLine.hasOption("d");

        String extension;
        if (fileNameWithExt.equals("/dev/null")) {
            logger.info("Null output device detected.");
            extension = "BMP";
        } else {
            extension = getExtension(fileNameWithExt);
            if (extension == null || !(extension.equals("png") || extension.equals("bmp"))) {
                printfErr("\nInvalid file extension!\n");
                return;
            }
        }

        int parallesism = parseInt(sparallelism);
        int segmentSize = parseInt(size);

        SegmentPerformer segmentPerformer = SegmentPerformer.decode(sp);
        SegmentStrategy  segmentStrategy  = SegmentStrategy.decode(ss);

        logger.info("Parallelism           : {} ", parallesism);
        logger.info("Segment strategy      : {} ", segmentStrategy);
        logger.info("Segment performer     : {} ", segmentPerformer);
        logger.info("Minimal segment size  : {} pixels ", segmentSize);
        logger.info("File format           : {} ", extension);

        BufferedImage destImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

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


    }

    public static void main(String[] args) throws Exception {
        Instant start = Instant.now();
        CommandLineParser parser = new DefaultParser();
        try {
            Options options = prepareOptions();
            CommandLine line = parser.parse(options, args);
            if (line.hasOption("h")) {
                printHelp(options);
            } else {
                process(line);
            }
            logger.info("Elapsed time          : {} ms", Duration.between(start,Instant.now()).toMillis());
        }
        catch( ParseException exp ) {
            logger.error(exp.getMessage());
        }
        System.exit(1);
    }
}
