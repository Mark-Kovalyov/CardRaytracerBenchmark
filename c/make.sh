#!/bin/bash

gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -o Raytracer_handofdos2.exe
gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -o Raytracer_handofdosavx2.exe
::gcc Raytracer_handofdos.c -O0 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -o Raytracer_handofdosAVX.exe   -pg
gcc Raytracer_handofdos_r3experimental.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -o Raytracer_handofdosAVX3.exe   
