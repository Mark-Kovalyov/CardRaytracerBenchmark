#!/bin/bash

java -jar target/CardRaytracerMt-1.0.jar -h


# 2 Threads

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
   --parallelism 2 \
   --segperf     G_RATIO \
   --segstr      AD \
   --segmentsize 2048 \
   --drawseg \
   --filename    out-g-ratio-2048px-2t.bmp

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
   --parallelism 2 \
   --segperf     G_RATIO \
   --segstr      AD \
   --segmentsize 1024 \
   --drawseg \
   --filename    out-g-ratio-1024px-2t.bmp

exit

# 3 Threads

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  3 G_RATIO AD 2048 out-g-ratio-2048px-3t.bmp drawseg

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  3 G_RATIO AD 1024 out-g-ratio-1024px-3t.bmp drawseg

# 4 Threads

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  4 G_RATIO AD 2048 out-g-ratio-2048px-4t.bmp drawseg

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  4 G_RATIO AD 1024 out-g-ratio-1024px-4t.bmp drawseg

# 5 Threads

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  5 G_RATIO AD 2048 out-g-ratio-2048px-5t.bmp drawseg

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  5 G_RATIO AD 1024 out-g-ratio-1024px-5t.bmp drawseg
