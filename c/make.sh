#!/bin/bash -v

# GCC

rm -f *asm
rm -f *exe

gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math                  -o Raytracer_handofdos2.exe
gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -S               -o Raytracer_handofdos2.asm
gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -S -fverbose-asm -o Raytracer_handofdos2-fverbose.asm

gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION                  -o Raytracer_handofdosavx2.exe
gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -S               -o Raytracer_handofdosavx2.asm
gcc Raytracer_handofdos_r2.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -S -fverbose-asm -o Raytracer_handofdosavx2-fverbose.asm

#::gcc Raytracer_handofdos.c -O0 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -o Raytracer_handofdosAVX.exe   -pg
gcc Raytracer_handofdos_r3experimental.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION                  -o Raytracer_handofdosAVX3.exe
gcc Raytracer_handofdos_r3experimental.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -S               -o Raytracer_handofdosAVX3.asm
gcc Raytracer_handofdos_r3experimental.c -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION -S -fverbose-asm -o Raytracer_handofdosAVX3-fverbose.asm

# Clang

clang Raytracer_handofdos_r2.c \
 -O3 \
 -march=native \
 -m64 \
 -msse4.2 \
 -ffast-math \
 -lm \
 -o Raytracer_handofdos_r2.clang.exe

clang Raytracer_handofdos_r2.c \
 -O3 \
 -march=native \
 -m64 \
 -msse4.2 \
 -ffast-math \
 -lm \
 -DAVX_VERSION \
 -o Raytracer_handofdos_r2.clang.exe

clang Raytracer_handofdos_r3experimental.c \
 -O3 \
 -march=native \
 -m64 \
 -msse4.2 \
 -ffast-math \
 -lm \
 -DAVX_VERSION \
 -o Raytracer_handofdos_r3experimental.clang.exe
