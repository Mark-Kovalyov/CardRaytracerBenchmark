#!/bin/bash -v

REPORT=d-report.csv

OPTIONS="-O2 -msse4 -ffast-math"

rm -f $REPORT

d1="$(date +'%s.%3N')"

./card-raytracer-d > /dev/null

d2="$(date +'%s.%3N')"

perl -e 'printf("Language/Type; Options ; Elapsed time\n")' >> $REPORT
perl -e "printf(\"Dlang ; $OPTIONS ; %0.2f s\n\", $d2 - $d1 )" >> $REPORT
