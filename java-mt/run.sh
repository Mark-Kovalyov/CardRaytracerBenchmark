#!/bin/bash

java \
 -XX:+UseSerialGC \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  4 G_RATIO AD 2048 out.bmp drawseg 

# drawseg


