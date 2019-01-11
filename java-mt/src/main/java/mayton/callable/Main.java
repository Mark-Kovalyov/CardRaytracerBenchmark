package mayton.callable;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

import static java.util.concurrent.TimeUnit.SECONDS;

public class Main {

    static Logger logger = LogManager.getLogger("Main");

    @SuppressWarnings({"squid:S2142","squid:S1854"})
    public static void main(String[] args) {

        ExecutorService executorService = Executors.newFixedThreadPool(4);

        List<Future<Integer>> futureList = new ArrayList<>();

        for(int i = 0;i < 20 ; i++) {
            Future<Integer> res = executorService.submit(new CardRaytracerCallable());
            futureList.add(res);
        }

        for(Future<Integer> future : futureList) {
            try {
                logger.info(":: waiting to get from future() id = {}", future.toString());
                Integer res = future.get();
            } catch (InterruptedException | ExecutionException e) {
                logger.error(e.toString());
            }
        }

        logger.info("Starting shutdown of FixedThreadPool");
        executorService.shutdown();
        try {
            if (!executorService.awaitTermination(10, SECONDS)) {
                executorService.shutdownNow();
                if (!executorService.awaitTermination(5, SECONDS)) {
                    logger.error("FixedThreadPool did not terminate");
                }
            }
        } catch (InterruptedException ie) {
            executorService.shutdownNow();
            Thread.currentThread().interrupt();
        }


    }

}
