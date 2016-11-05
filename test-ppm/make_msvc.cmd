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
cl.exe ppmcompare.cpp /MT /Ox
cl.exe resultparser.cpp /MT /Ox
cl.exe testtime.cpp /MT /Ox
del *.obj 
:end