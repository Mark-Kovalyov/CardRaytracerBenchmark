#!/bin/bash

brn=benchmark-report.txt
ethalon=01.cpp.ppm
timeutil=time
compareutil=test-ppm/ppmcompare
reportutil=

rm $brn

# ----------------------------------------------------------------
echo cpp
if [ -e ./cpp/card-raytracer-cpp ]; then
echo "[cpp (g++)]" >> $brn
g++ --version | head -n 1 >> $brn
(time ./cpp/card-raytracer-cpp $ethalon) 2>> $brn
fi

echo clang
if [ -e ./cpp/card-raytracer-cpp.clang ]; then
echo "[cpp (clang)]" >> $brn
clang --version | head -n 1 >> $brn
(time ./cpp/card-raytracer-cpp.clang 01.cpp-clang.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 01.cpp-clang.ppm >> $brn
fi

echo cpp-opt
if [ -e ./cpp/card-raytracer-opt-cpp ]; then
echo "[cpp-opt (g++)]" >> $brn
g++ --version | head -n 1 >> $brn
(time ./cpp/card-raytracer-opt-cpp 01.cpp-opt.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 01.cpp-opt.ppm >> $brn
fi

echo cpp-rwolf
if [ -e ./cpp/card-raytracer-rwolf-cpp ]; then
echo "[cpp-rwolf (g++)]" >> $brn
g++ --version | head -n 1 >> $brn
(time ./cpp/card-raytracer-rwolf-cpp 01.cpp-rwolf.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 01.cpp-rwolf.ppm >> $brn
fi

echo java
if [ -f java/CardRaytracer.class ]; then
echo "[java]" >> $brn
java -version 2>> $brn
cd java
(time java -XX:+UseSerialGC -XX:CompileThreshold=2 CardRaytracer ../02.java.ppm) 2>> ../$brn
cd ..
./test-ppm/ppmcompare $ethalon 02.java.ppm >> $brn
fi

echo d
if [ -e ./d/card-raytracer-d ]; then
echo "[d]" >> $brn
gdc --version | head -n 1 >> $brn
(time ./d/card-raytracer-d > 03.d.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 03.d.ppm >> $brn
fi

echo fpc
if [ -e ./fpc/card-raytracer-fpc ]; then
echo "[fpc]" >> $brn
fpc -h | head -n 1 >> $brn
(time ./fpc/card-raytracer-fpc > 04.fpc.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 04.fpc.ppm >> $brn
fi

echo c# mono
if [ -e ./c-sharp/card-raytracer-cs.exe ]; then
echo "[c# mono]" >> $brn
mono-csc --version >> $brn
(time ./c-sharp/card-raytracer-cs.exe 05.cs-mono.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 05.cs-mono.ppm >> $brn
fi

echo c# .net core
if [ -e ./c-sharp/card-raytracer.dll ]; then
echo "[c# .net core]" >> $brn
dotnet --version >> $brn
(time dotnet c-sharp/card-raytracer.dll 05.cs-core.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 05.cs-core.ppm >> $brn
fi

echo go
if [ -e ./go/card-raytracer-go ]; then
echo "[go]" >> $brn
`which go` version >> $brn
(time ./go/card-raytracer-go > 06.go.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 06.go.ppm >> $brn
fi

echo nodejs
if [ -f ./go/card-raytracer-go ]; then
echo "[nodejs]" >> $brn
echo -n "nodejs " >> $brn && nodejs --version >> $brn
(time nodejs js/card-raytracer.js > 07.js.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 07.js.ppm >> $brn
fi

echo rust
if [ -e ./rust/card-raytracer-rs2 ]; then
echo "[rust]" >> $brn
cargo --version | head -n 1 >> $brn
(time ./rust/card-raytracer-rs 08.rust.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 08.rust.ppm >> $brn
fi

echo pypy
if [ -f ./go/card-raytracer-go ]; then
#echo "[pypy]" >> $brn
echo -n "pypy " >> $brn && pypy --version 2>> $brn
(time pypy python/card-raytracer.py 10.py.ppm) 2>> $brn
./test-ppm/ppmcompare $ethalon 10.py.ppm >> $brn
fi

# Please add your laucher here ... 

./test-ppm/resultparser $brn >> $brn
cat $brn