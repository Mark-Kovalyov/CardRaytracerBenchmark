#!/bin/bash -v
java --version
time java -XX:+UseSerialGC -server -XX:CompileThreshold=2 CardRaytracer /dev/null
