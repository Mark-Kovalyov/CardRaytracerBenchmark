#!/bin/bash -v

OPTIONS="-O3 -march=native -pthread -std=c++11"

g++ $OPTIONS card_raytracer.cpp       -o card-raytracer-cpp-mt.exe

