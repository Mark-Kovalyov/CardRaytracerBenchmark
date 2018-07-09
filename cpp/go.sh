#!/bin/bash -v

REPORT=cpp-report.csv

OPTIONS="-O3 -march=native"

CLANG_OPTIONS="-O3 -march=native"

rm -f $REPORT

d1="$(date +'%s.%3N')"

./card-raytracer-cpp /dev/null

d2="$(date +'%s.%3N')"

./card-raytracer-opt-cpp /dev/null

d3="$(date +'%s.%3N')"

./card-raytracer-rwolf-cpp /dev/null

d4="$(date +'%s.%3N')"

./card-raytracer-cpp.clang /dev/null

d5="$(date +'%s.%3N')"

./card-raytracer-opt-cpp.clang /dev/null

d6="$(date +'%s.%3N')"

./card-raytracer-rwolf-cpp.clang /dev/null

d7="$(date +'%s.%3N')"

perl -e 'printf("Language/Type; Options ; Elapsed time\n")' >> $REPORT

perl -e "printf(\"C++/Canonical ; $OPTIONS ; %0.2f s\n\", $d2 - $d1 )" >> $REPORT
perl -e "printf(\"C++/Opt ;       $OPTIONS ; %0.2f s\n\", $d3 - $d2 )" >> $REPORT
perl -e "printf(\"C++/RWolf ;     $OPTIONS ; %0.2f s\n\", $d4 - $d3 )" >> $REPORT

perl -e "printf(\"Clang++/Canonical ; $CLANG_OPTIONS ; %0.2f s\n\", $d5 - $d4 )" >> $REPORT
perl -e "printf(\"Clang++/Opt ;       $CLANG_OPTIONS ; %0.2f s\n\", $d6 - $d5 )" >> $REPORT
perl -e "printf(\"Clang++/RWolf ;     $CLANG_OPTIONS ; %0.2f s\n\", $d7 - $d6 )" >> $REPORT

