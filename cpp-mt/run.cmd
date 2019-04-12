FOR /L %%i IN (1,1,12) DO (
 time card-raytracer-cpp-mt.exe "mt-%%i.ppm" %%i
)

FOR /L %%i IN (1,1,12) DO (
 time card-raytracer-cpp-actor.exe "actor-%%i.ppm" %%i
)

FOR /L %%i IN (1,1,12) DO (
 time card-raytracer-cpp-actor3.exe "actor3-%%i.ppm" %%i
)
