#!/bin/bash -v

python3 -V

echo "Start at : $(date +"%s")"

time python3 card-raytracer.py > 1.ppm

echo "Finish at : $(date +"%s")"
