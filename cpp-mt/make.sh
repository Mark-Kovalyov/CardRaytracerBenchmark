#!/bin/bash -v

OPTIONS="-O3 -march=native -pthread -std=c++11 -pedantic -Wall"

rm card-raytracer-cpp-actor.exe
g++ $OPTIONS card-raytracer-actor.cpp    -o card-raytracer-cpp-actor.exe

rm card-raytracer-cpp-mt.exe
g++ $OPTIONS card-raytracer-mt.cpp       -o card-raytracer-cpp-mt.exe
