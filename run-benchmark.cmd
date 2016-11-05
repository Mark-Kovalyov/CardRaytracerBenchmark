@rem -------- General configuration -----------------------

set brn=benchmark-report.txt
set ethalon=01.cpp.ppm
set timeutil=timethis
set compareutil=test-ppm\ppmcompare
set reportutil=

@rem -------- C/GCC/VC configuration ----------------------

set CPP_HOME=c:\MinGW-4.10.0

@rem -------- Java configuration --------------------------

set JAVA_HOME=c:\jdk1.7.0_80

@rem -------- .Net configuration --------------------------

set DOTNET_VERSION=v4.0.30319
set DOTNET32_HOME=%WINDIR%\Microsoft.NET\Framework\%DOTNET_VERSION%
set DOTNET64_HOME=%WINDIR%\Microsoft.NET\Framework64\DOTNET_VERSION%

@rem -------- Digital Mars D conf. ------------------------

set D_HOME=

@rem -------- NodeJS configuration ------------------------

set NODEJS_HOME=c:\nodejs

@rem -------- Python conf ---------------------------------

set PYTHON_HOME=c:\python34

@rem -------- PHP -----------------------------------------

set PHP_HOME=

@rem -------- Go Language ---------------------------------

set GOROOT=

@rem ------------------------------------------------------

del %brn%

if defined CPP_HOME (
 if exist cpp\card-raytracer.exe (
  echo "[cpp]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% cpp\card-raytracer.exe %ethalon% >> %brn%
 ) 
)

if defined JAVA_HOME (
 if exist java\CardRaytracer.class (
  set CLASSPATH=.;%JAVA_HOME%\lib;java
  echo "[java]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% %JAVA_HOME%\bin\java -server -XX:CompileThreshold=2 CardRaytracer 02.java.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 02.java.ppm >> %brn%
 )
)

if defined DOTNET_HOME (

 if exist c-sharp\card-raytracer.exe (
  echo "[c-sharp]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% c-sharp\card-raytracer.exe 03.C#x86.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 03.C#x86.ppm >> %brn%
 )

 if exist c-sharp\card-raytracer64.exe (
  echo "[c-sharp-x64]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% c-sharp\card-raytracer64.exe 04.C#x64.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 04.C#x64.ppm >> benchmark-report.txt
 )

)

if defined PYTHON_HOME (
 if exist python\card-raytracer.py (
  echo "[python]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% %PYTHON_HOME%\python python\card-raytracer.py 05.python.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 05.python.ppm >> benchmark-report.txt
 )
)

if defined NODEJS_HOME (
 if exist js\card-raytracer.js (
  echo "[js]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% %NODEJS_HOME%\node --harmony js\card-raytracer.js > 06.js.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 06.js.ppm >> benchmark-report.txt
 )
)

if defined D_HOME (
 if exist d\card-raytracer.d (
  echo "[js]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% d\card-raytracer.js > 07.d.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 07.d.ppm >> benchmark-report.txt
 )
)

if defined PHP_HOME (
 if exist php\card-raytracer.php (
  echo "[php]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% php php\card-raytracer.php > 08.php.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 08.php.ppm >> benchmark-report.txt
 )
)

if defined GOROOT (
 if exist go\card-raytracer.go (
  echo "[go]" >> %brn%
  echo "{time}" >> %brn%
  %timeutil% go\card-raytracer.exe > 09.go.ppm >> %brn%
  echo "{mce}" >> %brn%
  %compareutil% %ethalon% 09.go.ppm >> benchmark-report.txt
 )
)

if defined reportutil (
  %reportutil%
)

@rem Please add your laucher here ... 