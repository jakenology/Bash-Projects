#!/bin/bash

pass='number1 number12 number13 number14 number15 number16'
 chk='number14'
 for i in $pass ; do
   if [ "$i" == "$chk" ]; then
     echo ' Found ^_^'
   else
     echo 'loading 50%'
   fi
 done