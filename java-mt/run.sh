#!/bin/bash

# 2 Threads

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  2 G_RATIO AD 2048 out-g-ratio-2048px-2t.bmp drawseg

time java \
 -server \
 -XX:CompileThreshold=2 \
 -jar target/CardRaytracerMt-1.0.jar \
  2 G_RATIO AD 1024 out-g-ratio-1024px-2t.bmp drawseg

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
