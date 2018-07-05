package mayton;

import javax.annotation.Nonnull;

public enum SegmentStrategy{

    HD("Horizontal division by rectangles"),
    VD("Horizontal division by rectangles"),
    AD("Division all directions");

    String value;
    SegmentStrategy(String value){
        this.value=value;
    }
    @Override
    public String toString() {
        return value;
    }

    public static SegmentStrategy decode(@Nonnull String strategy) {
        for(SegmentStrategy s : SegmentStrategy.values()) {
            if (s.name().equals(strategy.toUpperCase())) {
                return s;
            }
        }
        return null;
    }
}
