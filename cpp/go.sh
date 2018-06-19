#!/bin/bash

REPORT=cpp-report.csv

OPTIONS="-Wextra -pedantic -O2 -msse4"

rm -f $REPORT

d1="$(date +%s)"

./card-raytracer-cpp /dev/null

d2="$(date +%s)"

./card-raytracer-opt-cpp /dev/null

d3="$(date +%s)"

./card-raytracer-rwolf-cpp /dev/null

d4="$(date +%s)"

echo "Language/Type; Options ; Elapsed time" >> $REPORT
echo "C++/Canonical ; $OPTIONS; $((d2 - d1)) s" >> $REPORT
echo "C++/Opt       ; $OPTIONS; $((d3 - d2)) s" >> $REPORT
echo "C++/RWolf     ; $OPTIONS; $((d4 - d3)) s" >> $REPORT

