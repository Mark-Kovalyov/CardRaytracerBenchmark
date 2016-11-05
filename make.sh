#!/bin/bash

for i in `ls` ; do
  if [ -f $i/make.sh ] ; then
     echo Compile $i
     cd $i
     ./make.sh
     cd ..
  fi
done
