#!/bin/bash


wget -qO- https://www.ss.com/lv/real-estate/flats/riga/today-5/ | egrep -o "(/lv/real-estate/flats/riga/[a-z]+/[a-z]+\.html)" | sort | uniq

