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
 
 7. Siemargl
 
 8. DRSM
 
 

# REPORTS

## Configuration: Ubuntu 16 LTS x86_64/Intel(R) Core(TM) i3-5005U CPU @ 2.00GHz

### C (gcc version 7.3.0/Clang)
| Author | anguage/Type | Options | Elapsed time
------|-------|---------|--------------
| Siemargl | C/Raytracer_handofdos2 | -O3 -march=native -m64 -msse4.2 -ffast-math |15,028s
| Siemargl | C/Raytracer_handofdosavx2 | -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 14,983s
| Siemargl | C/Raytracer_handofdosAVX3 | -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 58,454s
| Siemargl | Clang/Raytracer_handofdos_r2.clang.exe | -lm -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 16,868s
| Siemargl | Clang/Raytracer_handofdos_r3experimental.clang.exe |-lm -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 17,461s



### C++ (gcc version 7.3.0, clang version 6.0.0-1ubuntu2)

Language/Type | Options | Elapsed time
--------------|---------|-------------
C++/Canonical | -O3 -march=native | 18.74 s
C++/Opt |       -O3 -march=native | 16.47 s
C++/RWolf |     -O3 -march=native | 17.00 s
Clang++/Canonical | -O3 -march=native | 15.78 s
Clang++/Opt |       -O3 -march=native | 18.92 s
Clang++/RWolf |     -O3 -march=native | 19.41 s

### Rust (?)
Language/Type | Options | Elapsed time
--------------|---------|-------------
Rust | | 19.86 s

### Java-10 (10.0.1)

Author | Language/Type | Options | Elapsed time
-------|---------------|---------|-------------
Mayton | Java | -server -XXCompileThreashold=2  | 20s
Mayton | Java/AOT | -XX:AOTLibrary=... -server -XXCompileThreashold=2 | 19s

### Digital Mars D : gdc (Ubuntu 8-20180414-1ubuntu2) 8.0.1 20180414 (experimental)

Language/Type | Options | Elapsed time
--------------|---------|-------------
Dlang | -O2 -msse4 -ffast-math | 21.14 s

### Node JS

Author | Language/Type | Options | Elapsed time
-|--------------|---------|-------------
DRSM | NodeJS v8.10.0 |  | 121.76 s

### GoLang
Author | Language/Type | Options | Elapsed time
-|--------------|---------|-------------
DRSM |  |  | 



### Python/PyPy

Language/Type | Options | Elapsed time
--------------|---------|-------------

### C#/.Net (The Mono C# compiler is Copyright 2001-2011, Novell, Inc)

Language/Type | Options | Multithread options | Elapsed time 
--------------|---------|---------------------|-------------
|C#/Single-Thread | -o+ |                     | 75.31
|C#/Multi-Thread  | -o+ | 2 threads           | 37.67
|C#/Multi-Thread  | -o+ | 3 threads           | 41.34
|C#/Multi-Thread  | -o+ | 4 threads           | 40.34
|C#/Multi-Thread  | -o+ | 5 threads           | 41.76


### PHP

Authror | Language/Type | Options | Elapsed time
-|--------------|---------|-------------
DRSM | | |

### Ruby

Language/Type | Options | Elapsed time
--------------|---------|-------------

### Free Pascal

Language/Type | Options | Elapsed time
--------------|---------|-------------
FPC 3.0.4+dfsg-18 for x86_64 | -CX -O3 -XX -vewnhi -Fi. -Fu. -FU. | 55,48 | 

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
