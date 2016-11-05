package mayton;

import javax.annotation.Nonnull;
import java.awt.image.BufferedImage;

public class RecursiveActionFactory {

    private boolean drawMargins;
    private SegmentPerformer segmentPerformer;
    private int segmentSize;
    private String fileFormat;
    private SegmentStrategy segmentStrategy;

    public RecursiveActionFactory(@Nonnull SegmentPerformer segmentPerformer,
                                  int segmentSize,
                                  @Nonnull SegmentStrategy segmentStrategy,
                                  @Nonnull String fileFormat,
                                  boolean drawMargins){
        this.drawMargins      = drawMargins;
        this.segmentPerformer = segmentPerformer;
        this.segmentSize      = segmentSize;
        this.fileFormat       = fileFormat;
        this.segmentStrategy  = segmentStrategy;
    }

    @Nonnull
    public CardRaytraceRecursiveAction createAction(Rectangle rect, BufferedImage mutexImage) {
        return new CardRaytraceRecursiveAction(
                rect,segmentPerformer,segmentSize, segmentStrategy,fileFormat,mutexImage,drawMargins);
    }
}
