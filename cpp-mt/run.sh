#!/bin/bash -v

for i in {1..12}
do
 time ./card-raytracer-cpp-mt.exe mt-$i.ppm $i
done

for i in {1..12}
do
 time ./card-raytracer-cpp-actor.exe actor-$i.ppm $i
done

for i in {1..12}
do
 time ./card-raytracer-cpp-actor3.exe actor3-$i.ppm $i
done
