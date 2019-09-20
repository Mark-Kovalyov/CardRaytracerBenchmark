#!/bin/bash -v

java -version

java \
   -Xbatch -XX:-TieredCompilation -XX:+PrintCompilation \
   CardRaytracer /dev/null



