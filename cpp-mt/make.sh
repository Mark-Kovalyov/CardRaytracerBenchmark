#!/bin/bash -v

OPTIONS="-O2 -march=native -pthread -std=c++11 -pedantic"

rm card-raytracer-cpp-mt.exe
g++ $OPTIONS card-raytracer-mt.cpp       -o card-raytracer-cpp-mt.exe
