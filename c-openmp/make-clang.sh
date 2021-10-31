#!/bin/bash -ve

rm -f card-raytracer-openmp.exe

export OMP_DISPLAY_ENV="TRUE"

clang -O3 \
   card-raytracer-openmp.c \
   -o card-raytracer-openmp.exe \
   -fopenmp=libomp

echo "Error code = $?"
