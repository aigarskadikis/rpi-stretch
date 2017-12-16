#!/bin/bash




#atrod leetaako cenu kopaa ar linku
cenalinks=$(wget -qO- 'https://www.salidzini.lv/cena?q=samsung+evo+250gb' | sed 's/</\n/g' | grep -m1 -B20 'price.\s.*content' | grep 'click.*itemid\|price.\s' | sed 's/\d034/\n/g' | sed 's/\//https:\/\/www\.salidzini\.lv\//g' | grep '[0-9\.]' | sort | sed "s/\&amp;/\&/g")

#parada cenu
cena=$(echo "$cenalinks" | head -1)

redirect=$(echo "$cenalinks" | tail -1)

echo $cena
#echo $redirect

#atrod isto linku
url=$(curl -sS "$redirect" | grep "window.location" | sed "s/\d034/\n/g" | grep "^http")

echo $url
