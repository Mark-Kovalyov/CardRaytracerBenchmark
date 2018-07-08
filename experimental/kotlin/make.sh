#!/bin/bash
cd CardRaytracer
mvn package
cd ..
java -jar CardRaytracer/target/CardRaytracer-1.0-jar-with-dependencies.jar kotlin.ppm


