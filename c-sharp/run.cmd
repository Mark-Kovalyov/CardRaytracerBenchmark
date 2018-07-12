@echo off
if not exist card-raytracer.exe call make.cmd
echo .net core 1 thread
dotnet card-raytracer.dll C#core.ppm
echo x32 1 thread
card-raytracer.exe C#x86.ppm
echo x32 all CPUs
card-raytracer-mt.exe C#x86-mt.ppm
echo x64 1 thread
card-raytracer64.exe C#x64.ppm
echo x64 all CPUs
card-raytracer64-mt.exe C#x64-mt.ppm
pause