#!/bin/bash -v

REPORT=cpp-report.csv

OPTIONS="-O3 -march=native"

CLANG_OPTIONS="-O3 -march=native"

rm -f $REPORT

d1="$(date +'%s.%3N')"

./card-raytracer-cpp.exe /dev/null

d2="$(date +'%s.%3N')"

./card-raytracer-opt-cpp.exe /dev/null

d3="$(date +'%s.%3N')"

./card-raytracer-rwolf-cpp.exe /dev/null

d4="$(date +'%s.%3N')"

./card-raytracer-cpp.clang.exe /dev/null

d5="$(date +'%s.%3N')"

./card-raytracer-opt-cpp.clang.exe /dev/null

d6="$(date +'%s.%3N')"

./card-raytracer-rwolf-cpp.clang.exe /dev/null

d7="$(date +'%s.%3N')"

perl -e 'printf("Language/Type; Options ; Elapsed time\n")' >> $REPORT

perl -e "printf(\"C++/Canonical ; $OPTIONS ; %0.2f s\n\", $d2 - $d1 )" >> $REPORT
perl -e "printf(\"C++/Opt ;       $OPTIONS ; %0.2f s\n\", $d3 - $d2 )" >> $REPORT
perl -e "printf(\"C++/RWolf ;     $OPTIONS ; %0.2f s\n\", $d4 - $d3 )" >> $REPORT

perl -e "printf(\"Clang++/Canonical ; $CLANG_OPTIONS ; %0.2f s\n\", $d5 - $d4 )" >> $REPORT
perl -e "printf(\"Clang++/Opt ;       $CLANG_OPTIONS ; %0.2f s\n\", $d6 - $d5 )" >> $REPORT
perl -e "printf(\"Clang++/RWolf ;     $CLANG_OPTIONS ; %0.2f s\n\", $d7 - $d6 )" >> $REPORT

