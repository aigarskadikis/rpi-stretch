#!/bin/sh
echo "set nthreads 20"> /etc/apt/mirror.list
echo "set _tilde 0">> /etc/apt/mirror.list
grep -v "^$\|^#" /etc/apt/sources.list >> /etc/apt/mirror.list
grep -v "^$\|^#" /etc/apt/sources.list.d/raspi.list >> /etc/apt/mirror.list
grep -v "^$\|^#" /etc/apt/sources.list | cut -d" " -f2 | sed "s/^http/clean http/g;s/\/$//g">> /etc/apt/mirror.list
grep -v "^$\|^#" /etc/apt/sources.list.d/raspi.list | cut -d" " -f2 | sed "s/^http/clean http/g;s/\/$//g">> /etc/apt/mirror.list
sed -i "s/http:\/\//file:\/\/\/var\/spool\/apt-mirror\/mirror\//g" /etc/apt/sources.list
sed -i "s/http:\/\//file:\/\/\/var\/spool\/apt-mirror\/mirror\//g" /etc/apt/sources.list.d/raspi.list
