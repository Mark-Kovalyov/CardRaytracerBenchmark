#!/bin/bash
fpc -CX -O3 -XX -vewnhi -Fi. -Fu. -FU. card_raytracer.lpr
mv card_raytracer card-raytracer-fpc
