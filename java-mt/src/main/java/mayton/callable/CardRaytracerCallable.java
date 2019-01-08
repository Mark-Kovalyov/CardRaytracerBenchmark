package mayton.callable;

import mayton.CardRaytraceRecursiveAction;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Random;
import java.util.concurrent.Callable;

public class CardRaytracerCallable implements Callable<Integer> {

    static Logger logger = LogManager.getLogger("CardRaytracerCallable");

    @Override
    public Integer call() throws Exception {
        logger.info(":: enter call() with thread = {}", Thread.currentThread().getId());
        Thread.sleep(new Random().nextInt(15) * 1000);
        logger.info(":: exit call() with thread = {}", Thread.currentThread().getId());
        return 0;
    }

}
