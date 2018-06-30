#!/bin/bash -v

OPTIONS="-O3"

g++ $OPTIONS card-raytracer.cpp       -o card-raytracer-cpp
g++ $OPTIONS card-raytracer-rwolf.cpp -o card-raytracer-rwolf-cpp
g++ $OPTIONS card-raytracer-opt.cpp   -o card-raytracer-opt-cpp
