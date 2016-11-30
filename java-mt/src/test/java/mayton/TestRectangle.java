package mayton;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class TestRectangle {

    @Test
    public void testParse(){
        assertNull(Rectangle.parse(null));
        assertNull(Rectangle.parse(""));
        assertEquals(new Rectangle(437,0,512,195),
                Rectangle.parse("java-mt.ThreadId-ForkJoinPool-1-worker-1-Rect-437-0-512-195.png"));
        assertEquals(new Rectangle(0,195,120,316),
                Rectangle.parse("java-mt.ThreadId-ForkJoinPool-1-worker-1-Rect-0-195-120-316.jpg"));
    }

}
