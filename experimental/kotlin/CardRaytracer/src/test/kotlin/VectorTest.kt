import org.junit.Test
import org.junit.Assert.assertEquals;

class VectorTest {

    @Test
    fun testConstructor(){
        val v:Vector = Vector(2.0,3.0,5.0)
        assertEquals(2.0,v.x,0.001);
        assertEquals(3.0,v.y,0.001);
        assertEquals(5.0,v.z,0.001);
    }

    @Test
    fun testPlus(){
        val a:Vector = Vector(2.0,3.0,5.0)
        val b:Vector = Vector(7.0,11.0,13.0)
        val c:Vector = a.plus(b)
        assertEquals(c.x,a.x + b.x,0.001)
        assertEquals(c.y,a.y + b.y,0.001)
        assertEquals(c.z,a.z + b.z,0.001)
    }
}