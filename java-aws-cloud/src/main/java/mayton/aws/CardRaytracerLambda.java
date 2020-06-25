package mayton.aws;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CardRaytracerLambda implements RequestHandler<Integer, byte[]> {

    static Logger logger = LoggerFactory.getLogger(CardRaytracerLambda.class);

    @Override
    public byte[] handleRequest(Integer arg, Context context) {
        logger.info("Received argument {}", arg);
        return new byte[0];
    }

}
