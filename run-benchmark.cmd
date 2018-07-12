@rem -------- General configuration -----------------------

set brn=benchmark-report.txt
set ethalon=01.cpp.ppm
set timeutil=tools\testtime
set compareutil=tools\ppmcompare
set reportutil=

set JAVA_HOME=C:\jdk-10.0.1\

del %brn%

 if exist cpp\card-raytracer.exe (
  echo "[cpp]" >> %brn%
  %timeutil% cpp\card-raytracer.exe %ethalon% >> %brn%
 ) 

 if exist cpp\card-raytracer-avx.exe (
  echo "[cpp avx]" >> %brn%
  %timeutil% cpp\card-raytracer-avx.exe 02.cpp.ppm >> %brn%
  %compareutil% %ethalon% 02.cpp.ppm >> %brn%
 ) 

 if exist c-sharp\card-raytracer.exe (
  echo "[c# x86]" >> %brn%
  %timeutil% c-sharp\card-raytracer.exe 03.C#x86.ppm >> %brn%
  %compareutil% %ethalon% 03.C#x86.ppm >> %brn%
 )

 if exist c-sharp\card-raytracer64.exe (
  echo "[c# x64]" >> %brn%
  %timeutil% c-sharp\card-raytracer64.exe 04.C#x64.ppm >> %brn%
  %compareutil% %ethalon% 04.C#x64.ppm >> %brn%
 )

 if exist c-sharp\card-raytracer.dll (
  echo "[c# .net core]" >> %brn%
  %timeutil% dotnet c-sharp\card-raytracer.dll 05.C#core.ppm >> %brn%
  %compareutil% %ethalon% 05.C#core.ppm >> %brn%
 )


 if exist java\CardRaytracer.class (
  set CLASSPATH=.;%JAVA_HOME%\lib;java
  echo "[java]" >> %brn%
  %timeutil% %JAVA_HOME%\bin\java -server -XX:CompileThreshold=2 CardRaytracer 02.java.ppm >> %brn%
  %compareutil% %ethalon% 02.java.ppm >> %brn%
 )

 tools\resultparser.exe %brn%

@rem Please add your laucher here ... 