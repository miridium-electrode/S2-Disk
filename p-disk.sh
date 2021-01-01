#!/bin/bash

#if [[ $EUID -ne 0 ]]; then
   #echo "This script must be run as root" 
   #exit 1
#fi

echo "exexuting du -h /"
du -h / &>> p1_du_h.txt

echo executing 
