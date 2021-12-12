#!/bin/bash -v

rm -f *exe

gcc card-raytracer-mt.c -o card-raytracer-mt.exe -pthread

