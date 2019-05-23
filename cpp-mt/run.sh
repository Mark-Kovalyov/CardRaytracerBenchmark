#!/bin/bash -v

for i in {1..12}
do
 time ./card-raytracer-cpp-mt.exe mt-$i.ppm $i
done