#!/bin/bash -v

gdc -O2 -msse4 -ffast-math card-raytracer.d -o card-raytracer-d.exe
