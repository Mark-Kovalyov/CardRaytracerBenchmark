# Welcome to Card Raytracer Benchmark.

![card-raytrace](https://cloud.githubusercontent.com/assets/4938337/20038818/9a4ec53c-a442-11e6-9f69-a2a8effb9464.png)

# Our goals:

 1. Make the port of 'Card-Raytracer' into Java, Python, CSharp, Digital Mars D, GoLang, JavaScript

 2. Estimate performance index.

 3. Make conclusions



# Short insructions for Users:

 1. Download & Install Java, Python, CSharp, Digital Mars D, GoLang, JavaScript environment.

 2. Run 'run-benchmark'

 3. Read report.

# Developers

 1. Mayton

 2. Ruslan (kealon)

 3. MasterZiv (masterziv)

 4. dr-sm (dr-sm)

 5. Dmitriy (dmitriyt)

 6. Igor Yudincev (wolfnstein)

# REPORTS

## Configuration: Ubuntu 16 LTS x86_64/Intel(R) Core(TM) i3-5005U CPU @ 2.00GHz

### gcc version 7.3.0, clang version 6.0.0-1ubuntu2

Language/Type | Options | Elapsed time
--------------|---------|-------------
C++/Canonical | -O3 -march=native | 18.74 s
C++/Opt |       -O3 -march=native | 16.47 s
C++/RWolf |     -O3 -march=native | 17.00 s
Clang++/Canonical | -O3 -march=native | 15.78 s
Clang++/Opt |       -O3 -march=native | 18.92 s
Clang++/RWolf |     -O3 -march=native | 19.41 s

### Java-10 (10.0.1)

Language/Type | Options | Elapsed time
--------------|---------|-------------
Java | -server -XXCompileThreashold=2  | 20s
Java/AOT | -XX:AOTLibrary=... -server -XXCompileThreashold=2 | 19s

### Digital Mars D : gdc (Ubuntu 8-20180414-1ubuntu2) 8.0.1 20180414 (experimental)

Language/Type | Options | Elapsed time
--------------|---------|-------------
Dlang | -O2 -msse4 -ffast-math | 21.14 s

### Node JS

Language/Type | Options | Elapsed time
--------------|---------|-------------
NodeJS v8.10.0 |  | 121.76 s

### Python/PyPy

Language/Type | Options | Elapsed time
--------------|---------|-------------

### C#

Language/Type | Options | Elapsed time
--------------|---------|-------------

### PHP

Language/Type | Options | Elapsed time
--------------|---------|-------------

### Ruby

Language/Type | Options | Elapsed time
--------------|---------|-------------

### Free Pascal

Language/Type | Options | Elapsed time
--------------|---------|-------------

### Common Lisp

Language/Type | Options | Elapsed time
--------------|---------|-------------

# FAQ

 F: How to display .ppm file?

 A: Try to use:
     - http://www.irfanview.com/  
     - http://www.libreoffice.org/
    



Usefull links:

 1. Discussion:

    http://www.sql.ru/forum/1173809-1/tyapnichnyy-benchmark-cpu-part-1

 2. Other like projects

    https://github.com/mzucker/miniray
    https://github.com/dcousens/RayTracer
