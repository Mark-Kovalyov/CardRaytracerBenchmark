@echo off

if exist "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe" (
   set NETDIR64=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\
) 

if exist "%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe" (
   set NETDIR=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\
) else if exist "%WINDIR%\Microsoft.NET\Framework\v3.5\csc.exe" (
   set NETDIR=%WINDIR%\Microsoft.NET\Framework\v3.5\
) else (
   echo Can`t find .Net fremework
   goto end
)

if exist card-raytracer.exe del card-raytracer.exe
if exist card-raytracer64.exe del card-raytracer64.exe
echo Compile x86
%NETDIR%csc.exe card-raytracer.cs /o /platform:x86 /r:mscorlib.dll /r:system.dll
if not exist card-raytracer.exe (
   echo Compile error
   goto end
)
%NETDIR%csc.exe card-raytracer-mt.cs /o /platform:x86 /r:mscorlib.dll /r:system.dll


if "%NETDIR64%" == "" goto end
echo Compile x64
%NETDIR64%csc.exe /out:card-raytracer64.exe card-raytracer.cs /platform:x64 /o /r:mscorlib.dll /r:system.dll
if not exist card-raytracer64.exe (
   echo Compile error
   goto end
)
%NETDIR64%csc.exe /out:card-raytracer64-mt.exe card-raytracer-mt.cs /platform:x64 /o /r:mscorlib.dll /r:system.dll

:end