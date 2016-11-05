package mayton;

import javax.annotation.Nonnull;

import static java.lang.Math.sqrt;

public enum SegmentPerformer{

    QUATRO(0,0.25),
    HALF(1,0.5),
    THIRD(2,1.0/3.0),
    G_RATIO(3, 1.0/((1.0+sqrt(5.0))/2.0) );

    SegmentPerformer(int code,double splitValue){
        this.code = code;
        this.splitValue = splitValue;
    }

    int code;

    double splitValue;

    public String toString(){
        switch (code){
            case 0   : return "Quatro";
            case 1   : return "Half";
            case 2   : return "Third";
            case 3   : return "Golden ratio";
            default: return "";
        }
    }

    public static SegmentPerformer decode(@Nonnull String arg){
        switch (arg.toUpperCase()){
            case "HALF"   : return HALF;
            case "QUATRO" : return QUATRO;
            case "G_RATIO": return G_RATIO;
            case "THIRD"  : return THIRD;
            default:
                return null;
        }
    }

}
