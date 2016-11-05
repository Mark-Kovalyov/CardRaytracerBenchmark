package mayton;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.ThreadContext;

import javax.annotation.Nonnull;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Random;
import java.util.concurrent.RecursiveAction;

import static java.lang.Math.ceil;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;
import static mayton.CardRaytracerMt.HEIGHT;
import static mayton.CardRaytracerMt.WIDTH;

public class CardRaytraceRecursiveAction extends RecursiveAction {

    static Logger logger = LogManager.getLogger(CardRaytraceRecursiveAction.class);

    static final int SUB_SAMPLES = 64;

    // Position vectors:
    static final Vector ZERO_VECTOR            = new Vector(0.0,0.0,0.0);
    static final Vector Z_ORTHO_VECTOR         = new Vector(0.0,0.0,1.0);
    static final Vector CAMERA_ASPECT_VECTOR   = new Vector(17.0, 16.0, 8.0);
    static final Vector CAMERA_DEST_VECTOR     = new Vector(-6.0, -16.0, 0.0);

    // Color vectors:
    static final Vector COLOR_CELL1_VECTOR     = new Vector(3.0, 1.0, 1.0);
    static final Vector COLOR_CELL2_VECTOR     = new Vector(3.0, 3.0, 3.0);
    static final Vector COLOR_DARK_GRAY_VECTOR = new Vector(13.0, 13.0, 13.0);
    static final Vector COLOR_SKY              = new Vector(0.7, 0.6, 1.0);

    static final int G[] = {
            0b00111100011100010010,
            0b01000100100000010100,
            0b01000100100000011000,
            0b00111100111110010100,
            0b00000100100010010010,
            0b00000100100010010001,
            0b00111000011100010000,
            0b00000000000000010000,
            0b00000000000000010000
    };

    Rectangle rect;
    Path destDir;
    SegmentPerformer segmentPerformer;
    SegmentStrategy segmentStrategy;
    int segmentSize;
    String fileFormat;
    Random random = new Random();
    BufferedImage mutexImage;
    boolean drawMargins = false;
    RecursiveActionFactory factory;

    public CardRaytraceRecursiveAction(@Nonnull Rectangle rect, @Nonnull SegmentPerformer segmentPerformer,
                                       int segmentSize, @Nonnull SegmentStrategy segmentStrategy, @Nonnull String fileFormat,
                                       @Nonnull BufferedImage mutexImage, boolean drawMargins){
        this.rect             = rect;
        this.drawMargins      = drawMargins;
        this.segmentPerformer = segmentPerformer;
        this.segmentSize      = segmentSize;
        this.fileFormat       = fileFormat;
        this.segmentStrategy  = segmentStrategy;
        this.random.setSeed(System.currentTimeMillis());
        this.mutexImage       = mutexImage;
        factory = new RecursiveActionFactory(segmentPerformer,segmentSize,segmentStrategy,fileFormat,drawMargins);
        ThreadContext.put("id", String.valueOf(Thread.currentThread().getId()));
        logger.trace("constructor CardRaytraceRecursiveAction Thread = {}, Rectangle = {} ",Thread.currentThread().getName(),rect.toString());
    }

    Vector sampler(@Nonnull final Vector o,@Nonnull final Vector d) {
        DoubleBox t = new DoubleBox(0.0);
        VectorBox n = new VectorBox(ZERO_VECTOR);
        int m = tracer(o, d, t, n);
        if (m == 0) {
            return COLOR_SKY.prod(pow(1.0 - d.z, 4));
        }
        Vector h = o.sum(d.prod(t.value));
        Vector l = new Vector(9.0 + random.nextDouble(), 9.0 + random.nextDouble(), 16.0).sum(h.prod(-1.0)).norm();
        Vector r = d.sum(n.value.prod(n.value.sprod(d) * -2.0));
        double b = l.sprod(n.value);
        if (b < 0 || tracer(h, l, t, n) != 0) {
            b = 0;
        }
        double p = pow(l.sprod(r) * (b > 0 ? 1.0 : 0.0), 99.0);
        if ((m & 1) != 0) {
            h = h.prod(0.2);
            return ((((int) (ceil(h.x) + ceil(h.y)) & 1) != 0) ?
                    COLOR_CELL1_VECTOR :
                    COLOR_CELL2_VECTOR).prod(b * 0.2 + 0.1);
        }
        return new Vector(p, p, p).sum(sampler(h, r).prod(0.5));
    }

    public void process(@Nonnull Rectangle rect, @Nonnull Path destDir, @Nonnull String fileFormat) throws IOException {
        int width  = rect.getWidth();
        int height = rect.getHeight();
        int[] image = new int[width * height];
        Vector g = CAMERA_DEST_VECTOR.norm();
        Vector a = (Z_ORTHO_VECTOR.vprod(g)).norm().prod(0.002);
        Vector b = g.vprod(a).norm().prod(0.002);
        Vector c = a.sum(b).prod(-256.0).sum(g);
        int yy = height - 1;
        for (int y = rect.y2 - 1; y >= rect.y1; y--) {
            // TODO: Investigate for reverse loop for xx
            int xx = width - 1;
            for (int x = rect.x2 - 1; x >= rect.x1; x--) {
                Vector p = COLOR_DARK_GRAY_VECTOR;
                for (int r = 0; r < SUB_SAMPLES; r++) {
                    Vector t = a.prod(random.nextDouble() - 0.5).prod(99.0).sum(b.prod(random.nextDouble() - 0.5).prod(99.0));
                    p = sampler(CAMERA_ASPECT_VECTOR.sum(t),
                            t.prod(-1.0).sum(a.prod(random.nextDouble() + x).sum(b.prod(random.nextDouble() + y)).sum(c).prod(16.0)).norm()
                    ).prod(3.5).sum(p);
                }
                int R = (int) p.x;
                int G = (int) p.y;
                int B = (int) p.z;
                image[xx + yy * width] = R << 16 | G << 8 | B ;
                xx--;
            }
            yy--;
        }

        if (drawMargins) {
            for (int x = 0; x < width; x += 2) {
                image[x] = Color.GREEN.getRGB();
            }
            for (int y = 0; y < height; y += 2) {
                image[y * width] = Color.GREEN.getRGB();
            }
        }

        synchronized (mutexImage) {

            int xd = rect.x1;
            int yd = rect.y1;
            int X1 = WIDTH - xd - 1;
            int X2 = WIDTH - xd - 1 - width;
            int i = 0;
            for (int y = 0; y < height; y++) {
                int Y1 = HEIGHT - yd - 1 - y;
                // TODO: Investigate for reverse loop for x
                for (int x = X1; x > X2; x--) {
                    mutexImage.setRGB(x, Y1, image[i++]);
                }
            }
        }

    }

    private int tracer(final Vector o, final Vector d, final DoubleBox t, final VectorBox n) {
        t.value = 1e9;
        int m = 0;
        double p = -o.z / d.z;

        if (0.01 < p) {
            t.value = p;
            n.value = Z_ORTHO_VECTOR;
            m = 1;
        }

        for (int k = 18; k >= 0; k--) {
            for (int j = 8; j >= 0; j--) {
                if ((G[j] & 1 << k) != 0) {
                    Vector _p = o.sum(new Vector(-k, 0.0, -j - 4.0));
                    double b = _p.sprod(d);
                    double c = _p.sprod(_p) - 1.0;
                    double q = b * b - c;
                    if (q > 0) {
                        double s = -b - sqrt(q);
                        if (s < t.value && s > 0.01) {
                            t.value = s;
                            n.value = (_p.sum(d.prod(t.value))).norm();
                            m = 2;
                        }
                    }
                }
            }
        }
        return m;
    }

    protected void computeDirectly() {
        logger.trace("processing Rectangle = {}",rect.getRectString());
        try {
            process(rect, destDir,fileFormat);
        } catch (IOException e) {
            logger.error(e);
        }
    }

    @Override
    protected void compute() {
        try {
            if (rect.getWidth() == 0 || rect.getHeight() == 0) {
                return;
            }
            if (segmentStrategy == SegmentStrategy.HD) {
                if (rect.getHeight() <= segmentSize / HEIGHT) {
                    computeDirectly();
                    return;
                }
                int height = rect.getHeight();
                int segmentCutpoint = (int) (height * segmentPerformer.splitValue);
                Rectangle r1 = new Rectangle(rect.x1, rect.y1, rect.x2, rect.y1 + segmentCutpoint);
                Rectangle r2 = new Rectangle(rect.x1, rect.y1 + segmentCutpoint, rect.x2, rect.y2);
                invokeAll(factory.createAction(r1, mutexImage),factory.createAction(r2, mutexImage));
            } else if (segmentStrategy == SegmentStrategy.VD) {
                if (rect.getWidth() <= segmentSize / WIDTH) {
                    computeDirectly();
                    return;
                }
                int width = rect.getWidth();
                int segmentCutpoint = (int) (width * segmentPerformer.splitValue);
                Rectangle r1 = new Rectangle(rect.x1 + segmentCutpoint, rect.y1, rect.x2, rect.y2);
                Rectangle r2 = new Rectangle(rect.x1, rect.y1, rect.x1 + segmentCutpoint, rect.y2);
                invokeAll(factory.createAction(r1, mutexImage),factory.createAction(r2, mutexImage) );
            } else if (segmentStrategy == SegmentStrategy.AD) {
                int width = rect.getWidth();
                int height = rect.getHeight();
                if (width * height < segmentSize) {
                    computeDirectly();
                    return;
                }
                Rectangle r1;
                Rectangle r2;
                if (width > height) {
                    int segmentCutpoint = (int) (width * segmentPerformer.splitValue);
                    r1 = new Rectangle(rect.x1 + segmentCutpoint, rect.y1, rect.x2, rect.y2);
                    r2 = new Rectangle(rect.x1, rect.y1, rect.x1 + segmentCutpoint, rect.y2);
                    invokeAll(factory.createAction(r1, mutexImage), factory.createAction(r2, mutexImage));
                } else {
                    int segmentCutpoint = (int) (height * segmentPerformer.splitValue);
                    r1 = new Rectangle(rect.x1, rect.y1, rect.x2, rect.y1 + segmentCutpoint);
                    r2 = new Rectangle(rect.x1, rect.y1 + segmentCutpoint, rect.x2, rect.y2);
                    invokeAll(factory.createAction(r1, mutexImage),factory.createAction(r2, mutexImage));
                }
            }
        }
        finally {
            ThreadContext.clearMap();
        }
    }
}
