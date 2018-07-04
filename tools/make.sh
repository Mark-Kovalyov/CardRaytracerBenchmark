#!/bin/bash
g++ -Wextra -pedantic -O2 -msse4 testtime.cpp -o testtime
g++ -Wextra -pedantic -O2 -msse4 ppmcompare.cpp -o ppmcompare
g++ -Wextra -pedantic -O2 -msse4 resultparser.cpp -o resultparser
