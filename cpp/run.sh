#!/bin/bash -v

time ./card-raytracer-cpp 1.ppm
time ./card-raytracer-rwolf-cpp 1.ppm
time ./card-raytracer-opt-cpp 1.ppm

time ./card-raytracer-cpp.clang 1.ppm
time ./card-raytracer-rwolf-cpp.clang 1.ppm
time ./card-raytracer-opt-cpp.clang 1.ppm

