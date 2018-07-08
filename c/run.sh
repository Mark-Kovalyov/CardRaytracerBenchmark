#!/bin/bash -v

time ./Raytracer_handofdos2.exe 1.ppm
time ./Raytracer_handofdosavx2.exe 2.ppm
time ./Raytracer_handofdosAVX3.exe 3.ppm

time ./Raytracer_handofdos_r2.clang.exe 4.ppm
time ./Raytracer_handofdos_r3experimental.clang.exe 5.ppm

