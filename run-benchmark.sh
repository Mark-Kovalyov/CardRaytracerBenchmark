#!/bin/bash

brn=benchmark-report.txt
ethalon=01.cpp.ppm
timeutil=time
compareutil=test-ppm/ppmcompare
reportutil=

# ------------------ Java configuration --------------------------

JAVA_HOME=/jdk1.7.0_80

rm $brn

# ----------------------------------------------------------------
echo cpp
if [ -e ./cpp/card-raytracer-cpp ]; then

echo "[cpp]" >> $brn
g++ --version | head -n 1 >> $brn
($timeutil ./cpp/card-raytracer-cpp $ethalon) 2>> $brn

fi
echo java
if [ -f java/CardRaytracer.class ]; then
CLASSPATH=.:$JAVA_HOME/lib:java
echo "[java]" >> $brn
java -version 2>> $brn
($timeutil $JAVA_HOME/bin/java -server -XX:CompileThreshold=2 CardRaytracer 02.java.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 02.java.ppm >> $brn

fi

echo d
if [ -e ./d/card-raytracer-d ]; then

echo "[d]" >> $brn
gdc --version | head -n 1 >> $brn
($timeutil ./d/card-raytracer-d > 03.d.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 03.d.ppm >> $brn

fi
echo fpc
if [ -e ./fpc/card-raytracer-fpc ]; then

echo "[fpc]" >> $brn
fpc -h | head -n 1 >> $brn
($timeutil ./fpc/card-raytracer-fpc > 04.fpc.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 04.fpc.ppm >> $brn

fi
echo c-sharp
if [ -e ./c-sharp/card-raytracer-cs.exe ]; then

echo "[c-sharp]" >> $brn
mono-csc --version >> $brn
($timeutil ./c-sharp/card-raytracer-cs.exe 05.cs.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 05.cs.ppm >> $brn

fi
echo go
if [ -e ./go/card-raytracer-go ]; then

echo "[go]" >> $brn
`which go` version >> $brn
($timeutil ./go/card-raytracer-go > 06.go.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 06.go.ppm >> $brn

fi
echo nodejs
if [ -f ./js/card-raytracer.js ]; then

echo "[js]" >> $brn
echo -n "nodejs " >> $brn && nodejs --version >> $brn
($timeutil nodejs ./js/card-raytracer.js > 07.js.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 07.js.ppm >> $brn

fi

# Please add your laucher here ... 
./test-ppm/resultparser $brn >> $brn
cat $brn