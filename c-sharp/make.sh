#!/bin/bash

mono-csc card-raytracer.cs -o+ -out:card-raytracer-cs.exe

dotnet build -o ./ -c release