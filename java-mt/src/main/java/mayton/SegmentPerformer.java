package mayton;

import javax.annotation.Nonnull;

import static java.lang.Math.random;
import static java.lang.Math.sqrt;

public enum SegmentPerformer{

    QUATRO(0,0.25,"Quatro"),
    HALF(1,0.5,"Half"),
    THIRD(2,1.0/3.0,"Third"),
    G_RATIO(3, 1.0/((1.0+sqrt(5.0))/2.0),"Golden ratio");

    SegmentPerformer(int code,double splitValue,String desc){
        this.code = code;
        this.splitValue = splitValue;
        this.desc = desc;
    }

    int code;

    double splitValue;

    String desc;

    public String toString(){
        return desc;
    }

    public static SegmentPerformer decode(@Nonnull String performer){
        for(SegmentPerformer s : SegmentPerformer.values()) {
            if (s.name().equals(performer)) {
                return s;
            }
        }
        return null;
    }

}
