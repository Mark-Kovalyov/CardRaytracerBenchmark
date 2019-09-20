#!/bin/bash -v

java \
  -server \
  -XX:CompileThreshold=2 \
  -XX:AOTLibrary=./CardRaytracer.so \
   CardRaytracer /dev/null
