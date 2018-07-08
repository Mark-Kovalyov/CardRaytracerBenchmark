#!/bin/bash -v

OPTIONS="-O3 -march=native"

CLANG_OPTIONS="-O3 -march=native"

g++ $OPTIONS card-raytracer.cpp       -o card-raytracer-cpp.exe
g++ $OPTIONS card-raytracer-rwolf.cpp -o card-raytracer-rwolf-cpp.exe
g++ $OPTIONS card-raytracer-opt.cpp   -o card-raytracer-opt-cpp.exe

clang++ $CLANG_OPTIONS card-raytracer.cpp       -o card-raytracer-cpp.clang.exe
clang++ $CLANG_OPTIONS card-raytracer-rwolf.cpp -o card-raytracer-rwolf-cpp.clang.exe
clang++ $CLANG_OPTIONS card-raytracer-opt.cpp   -o card-raytracer-opt-cpp.clang.exe

