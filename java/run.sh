#!/bin/bash

#CLASSPATH=.:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib

java -XX:+UseSerialGC -server -XX:CompileThreshold=2 CardRaytracer /dev/null
