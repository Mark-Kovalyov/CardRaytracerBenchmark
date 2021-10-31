#!/bin/bash -ve

rm -f card-raytracer-openmp.exe

export OMP_DISPLAY_ENV="TRUE"

g++ -O3 -o card-raytracer-openmp.exe \
    -fopenmp card-raytracer-openmp.c

echo "Error code = $?"
