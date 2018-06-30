#!/bin/bash -v

java \
  -XX:+UseSerialGC \
  -server \
  -XX:CompileThreshold=2 \
  -XX:AOTLibrary=./CardRaytracer.so \
   CardRaytracer /dev/null
