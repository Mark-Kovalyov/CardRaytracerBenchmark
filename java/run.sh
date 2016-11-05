#!/bin/bash
java -XX:+UseSerialGC 7-server -XX:CompileThreshold=2 CardRaytracer java.ppm
