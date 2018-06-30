#!/bin/bash -v

REPORT=cpp-report.csv

OPTIONS="-O3"

CLANG_OPTIONS="-O3"

rm -f $REPORT

d1="$(date +%s)"

./card-raytracer-cpp /dev/null

d2="$(date +%s)"

./card-raytracer-opt-cpp /dev/null

d3="$(date +%s)"

./card-raytracer-rwolf-cpp /dev/null

d4="$(date +%s)"

./card-raytracer-cpp.clang /dev/null

d5="$(date +%s)"

./card-raytracer-opt-cpp.clang /dev/null

d6="$(date +%s)"

./card-raytracer-rwolf-cpp.clang /dev/null

d7="$(date +%s)"

echo "Language/Type; Options ; Elapsed time" >> $REPORT
echo "C++/Canonical ; $OPTIONS; $((d2 - d1)) s" >> $REPORT
echo "C++/Opt       ; $OPTIONS; $((d3 - d2)) s" >> $REPORT
echo "C++/RWolf     ; $OPTIONS; $((d4 - d3)) s" >> $REPORT
echo "Clang++/Canonical ; $CLANG_OPTIONS; $((d5 - d4)) s" >> $REPORT
echo "Clang++/Opt       ; $CLANG_OPTIONS; $((d6 - d5)) s" >> $REPORT
echo "Clang++/RWolf     ; $CLANG_OPTIONS; $((d7 - d6)) s" >> $REPORT

