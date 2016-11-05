package mayton;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.lang.Integer.parseInt;
import static java.lang.Integer.valueOf;
import static java.lang.Math.max;
import static java.lang.Math.min;
import static java.lang.String.format;

@Immutable
public final class Rectangle{

    final int x1,y1;
    final int x2,y2;

    public Rectangle(int x1, int y1, int x2, int y2) {
        this.x1 = min(x1,x2);
        this.y1 = min(y1,y2);
        this.x2 = max(x1,x2);
        this.y2 = max(y1,y2);
    }
    public int getSquare(){
        return getWidth() * getHeight();
    }

    @Nonnull
    @Override
    public String toString() {
        return format("%d-%d-%d-%d", x1, y1, x2, y2);
    }

    @Nonnull
    public String getRectString(){
        return format("[ %d,%d ; %d,%d ], width = %d, height = %d, Square = %d", x1, y1, x2, y2,getWidth(),getHeight(),getSquare());
    }

    public int getHeight() {
        return y2-y1;
    }

    public int getWidth() {
        return x2-x1;
    }

    @Nullable
    public static Rectangle parse(@Nullable String fileName) {
        if (fileName==null || fileName.isEmpty()){
            return null;
        }
        Pattern pattern = Pattern.compile(
                        ".+-(?<x1>\\d{1,5})-" +
                        "(?<y1>\\d{1,5})-" +
                        "(?<x2>\\d{1,5})-" +
                        "(?<y2>\\d{1,5}).+");

        Matcher matcher = pattern.matcher(fileName);

        if (matcher.matches()){
            int x1 = parseInt(matcher.group("x1"));
            int y1 = parseInt(matcher.group("y1"));
            int x2 = parseInt(matcher.group("x2"));
            int y2 = parseInt(matcher.group("y2"));
            return new Rectangle(x1,y1,x2,y2);
        } else {
            return null;
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Rectangle rectangle = (Rectangle) o;

        if (x1 != rectangle.x1) return false;
        if (y1 != rectangle.y1) return false;
        if (x2 != rectangle.x2) return false;
        return y2 == rectangle.y2;

    }

    @Override
    public int hashCode() {
        int result = x1;
        result = 31 * result + y1;
        result = 31 * result + x2;
        result = 31 * result + y2;
        return result;
    }
}
