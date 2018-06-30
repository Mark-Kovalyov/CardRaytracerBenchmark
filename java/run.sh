#!/bin/bash -v

java -XX:+UseSerialGC -server -XX:CompileThreshold=2 CardRaytracer /dev/null
