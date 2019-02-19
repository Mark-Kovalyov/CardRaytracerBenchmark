#!/bin/bash

java -jar target/CardRaytracerMt-1.0.jar -h

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
   --parallelism 3 \
   --segperf     G_RATIO \
   --segstr      AD \
   --segmentsize 2048 \
   --drawseg \
   --filename    out-g-ratio-2048px-3t.bmp

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
   --parallelism 4 \
   --segperf     G_RATIO \
   --segstr      AD \
   --segmentsize 2048 \
   --drawseg \
   --filename    out-g-ratio-2048px-4t.bmp

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
   --parallelism 5 \
   --segperf     G_RATIO \
   --segstr      AD \
   --segmentsize 2048 \
   --drawseg \
   --filename    out-g-ratio-2048px-5t.bmp

