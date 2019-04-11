#!/bin/bash

java -jar target/CardRaytracerMt-1.0.jar -h

for i in {1..12}
do
 time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
   --parallelism $i \
   --segperf     G_RATIO \
   --segstr      AD \
   --segmentsize 2048 \
   --drawseg \
   --filename    out-g-ratio-2048px-$i.png

done
