package mayton;


import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.PrintStream;

import static java.lang.System.err;
import static java.lang.System.out;

/**
 * Console Utils
 */
public class ConsoleUtils {

    public static void println(@Nullable String line){
        out.println(line);
    }

    @Nonnull
    public static PrintStream printf_err(@Nonnull String format,@Nullable Object ...args){
        return err.printf(format, args);
    }

    @Nonnull
    public static PrintStream printf(@Nonnull String format,@Nullable Object ...args){
        return out.printf(format, args);
    }

}
