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

## Hardware configuration details
| Parameter           | Value 
|---------------------|-------
|Architecture:        |x86_64
|CPU op-mode(s):      |32-bit, 64-bit
|Byte Order:          |Little Endian
|CPU(s):              |12|
|On-line CPU(s) list: |0-11
|Thread(s) per core:  |2
|Core(s) per socket:  |6
|Socket(s):           |1
|NUMA node(s):        |1
|Vendor ID:           |AuthenticAMD
|CPU family:          |23
|Model:               |1
|Model name:          |AMD Ryzen 5 1600 Six-Core Processor
|Stepping:            |1
|CPU MHz:             |1374.622
|CPU max MHz:         |3200.0000
|CPU min MHz:         |1550.0000
|BogoMIPS:            |6387.20
|Virtualization:      |AMD-V
|L1d cache:           |32K
|L1i cache:           |64K
|L2 cache:            |512K
|L3 cache:            |8192K
|NUMA node0 CPU(s):   |0-11


### Rust (rustc 1.39.0, cargo 1.39.0, Linux 5.3.0-28-generic 18.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux) 15-Feb-2020
| Author |Language/Type | Options   | Elapsed time
|--------|--------------|-----------|-------------
| -      | Rust         | --release | 8.7 s

### C (gcc version 7.4.0/Clang, Linux 5.3.0-28-generic 18.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux) 15-Feb-2020
| Author | Language/Type | Options | Elapsed time
------|-------|---------|--------------
| Siemargl | C/Raytracer_handofdos2 | -O3 -march=native -m64 -msse4.2 -ffast-math |9.8 s
| Siemargl | C/Raytracer_handofdosavx2 | -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 10.9 s
| Siemargl | C/Raytracer_handofdosAVX3 | -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 32.7 s
| Siemargl | Clang/Raytracer_handofdos_r2.clang.exe | -lm -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 10.8
| Siemargl | Clang/Raytracer_handofdos_r3experimental.clang.exe |-lm -O3 -march=native -m64 -msse4.2 -ffast-math -DAVX_VERSION | 10.8

### C++ (gcc version 7.4.0, clang version 6.0.0-1ubuntu2, Linux 5.3.0-28-generic 18.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux) 16-Feb 2020

|Author   | Language/Type     | Options           | Elapsed time
|---------|-------------------|-------------------|-------------
|Heckbert | C++/Canonical     | -O3 -march=native | 10.37 s
|-        | C++/Opt           | -O3 -march=native | 10.03 s
|RWolf    | C++/RWolf         | -O3 -march=native | 9.06 s
|Heckbert | Clang++/Canonical | -O3 -march=native | 10.67 s
|-        | Clang++/Opt       | -O3 -march=native | 12.97 s
|RWolf    | Clang++/RWolf     | -O3 -march=native | 13.32 s

### Java-11 (OpenJDK 11.0.4 64-Bit, Linux 5.3.0-28-generic 18.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux) 15-Feb-2020

Author | Language/Type | Multithread options | Elapsed time
-------|---------------|---------------------|-------------
Mayton | Java          |                     | 12s
Mayton | Java | 2 threads  | ?
Mayton | Java | 3 threads  | ?
Mayton | Java | 4 threads  | ?
Mayton | Java | 5 threads  | ?

### Digital Mars D : gdc (Ubuntu 8-20180414-1ubuntu2) 8.0.1 20180414 (experimental) (no up-to-date!)

Language/Type | Options | Elapsed time
--------------|---------|-------------
Dlang | -O2 -msse4 -ffast-math | 21.14 s

### GoLang (Linux 5.3.0-28-generic 18.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux) 29-Feb-2020
Author | Language/Type | Options | Elapsed time
|------|---------------|---------|-------------
DRSM | go1.10.4 linux/amd64 |  | 23 s

### Free Pascal (Linux 5.3.0-28-generic 18.04.1-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux) 29-Feb-2020

|Author | Language/Type | Options | Elapsed time
|-------|---------------|---------|-------------
| -     | FPC 3.0.4+dfsg-18ubuntu2 for x86_64 | -CX -O3 -XX -vewnhi -Fi. -Fu. -FU. | 32 s

### Node JS (non up-to-date!)

Author | Language/Type | Options | Elapsed time
-|--------------|---------|-------------
DRSM | NodeJS v8.10.0 |  | 1m 30 s

### Python/PyPy (non up-to-date!)

Language/Type | Options | Elapsed time
--------------|---------|-------------

### C#/.Net (The Mono C# compiler is Copyright 2001-2011, Novell, Inc) (non up-to-date!)

Language/Type | Options | Multithread options | Elapsed time 
--------------|---------|---------------------|-------------
|C#/Single-Thread | -o+ |                     | 75.31
|C#/Multi-Thread  | -o+ | 2 threads           | 37.67
|C#/Multi-Thread  | -o+ | 3 threads           | 41.34
|C#/Multi-Thread  | -o+ | 4 threads           | 40.34
|C#/Multi-Thread  | -o+ | 5 threads           | 41.76


### PHP (non up-to-date!)

Authror | Language/Type | Options | Elapsed time
-|--------------|---------|-------------
DRSM | | |

### Ruby (non up-to-date!)

Language/Type | Options | Elapsed time
--------------|---------|-------------


### Common Lisp (non up-to-date!)

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
