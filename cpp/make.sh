#!/bin/bash
g++ -Wextra -pedantic -O2 -msse4 card-raytracer.cpp       -o card-raytracer-cpp
g++ -Wextra -pedantic -O2 -msse4 card-raytracer-rwolf.cpp -o card-raytracer-rwolf-cpp
g++ -Wextra -pedantic -O2 -msse4 card-raytracer-opt.cpp   -o card-raytracer-opt-cpp
