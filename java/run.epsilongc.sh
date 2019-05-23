#!/bin/bash -v

java -version

java \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+UseEpsilonGC \
  -Xmx5120M \
  -server \
  -XX:CompileThreshold=2 \
   CardRaytracer /dev/null
