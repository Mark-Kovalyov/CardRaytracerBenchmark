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
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v10.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v8.1A
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v8.1
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v8.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v8.0
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v7.1A
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v7.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
set SDK=%ProgramFiles%\Microsoft SDKs\Windows\v6.0A
if exist "%SDK%\Lib\Kernel32.Lib" goto crtlib
echo MS SDK not found
goto end

:crtlib
set CRTL=%ProgramFiles%\Windows Kits\10\Lib\10.0.10240.0\ucrt
if exist "%CRTL%\x64\libucrt.Lib" goto crtincl
set CRTL=

:crtincl
set CRTI=%ProgramFiles%\Windows Kits\10\Include\10.0.10240.0\ucrt
if exist "%CRTI%\stdio.h" goto comp
set CRTI=

:comp
echo *****************************************
echo use %MSVC%
echo use %SDK%
echo use %CRTL%
echo use %CRTI%
echo *****************************************
#set PATH=%CRTL%\x86\;%MSVC%\VC\bin\;%MSVC%\Common7\IDE\;%PATH%
#set INCLUDE=%CRTI%\;%MSVC%\VC\include\;%SDK%\include\
#set LIB=%CRTL%\x86\;%MSVC%\VC\lib\;%SDK%\lib\

set PATH=%CRTL%\x64\;%MSVC%\VC\bin\amd64\;%MSVC%\Common7\IDE\;%PATH%
set INCLUDE=%CRTI%\;%MSVC%\VC\include\;%SDK%\include\
set LIB=%CRTL%\x64\;%MSVC%\VC\lib\amd64\;%SDK%\lib\x64\


del *.exe
cl.exe ppmcompare.cpp /MT /Ox
cl.exe resultparser.cpp /MT /Ox
cl.exe testtime.cpp /MT /Ox
del *.obj 
:end