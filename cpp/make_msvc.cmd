@echo off
set MSVC=%ProgramFiles%\Microsoft Visual Studio 14.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
set MSVC=%ProgramFiles%\Microsoft Visual Studio 13.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
set MSVC=%ProgramFiles%\Microsoft Visual Studio 12.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
set MSVC=%ProgramFiles%\Microsoft Visual Studio 11.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
set MSVC=%ProgramFiles%\Microsoft Visual Studio 10.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
set MSVC=%ProgramFiles%\Microsoft Visual Studio 9.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
set MSVC=%ProgramFiles%\Microsoft Visual Studio 8.0
if exist "%MSVC%\VC\bin\cl.exe" goto sdk
echo MS VC compiler not found
goto end

:sdk
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v8.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto comp
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v8.0
if exist "%SDK%\Lib\Kernel32.Lib" goto comp
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v7.1A
if exist "%SDK%\Lib\Kernel32.Lib" goto comp
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v7.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto comp
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v6.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto comp
echo MS SDK not found
goto end

:comp
echo use %MSVC% and %SDK%
set PATH=%MSVC%\VC\bin\;%MSVC%\Common7\IDE\;%PATH%
set INCLUDE=%MSVC%\VC\include\;%SDK%\include\
set LIB=%MSVC%\VC\lib\;%SDK%\lib\

del *.exe
@rem Если компилировать следующей строкой - работает быстрее, но вылетает на некоторых процах
@rem cl.exe card-raytracer.cpp /Ox /MT /arch:AVX /Qfast_transcendentals
cl.exe card-raytracer.cpp /O2 /MT
cl.exe card-raytracer-rwolf.cpp /O2 /MT
del *.obj
:end
