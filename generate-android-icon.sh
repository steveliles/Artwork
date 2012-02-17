#!/bin/bash

filename_with_ext=$1
filename_with_pfx=${filename_with_ext%.*f}
filename=${filename_with_pfx#\./}

if [ ! -d "$2" ]; then
  mkdir "$2"  
fi

if [ ! -d "$2/png" ]; then
  mkdir "$2/png"  
fi

if [ ! -d "$2/xhdpi" ]; then
  mkdir "$2/xhdpi"  
fi

if [ ! -d "$2/hdpi" ]; then
  mkdir "$2/hdpi"  
fi

if [ ! -d "$2/mdpi" ]; then
  mkdir "$2/mdpi"  
fi

if [ ! -d "$2/ldpi" ]; then
  mkdir "$2/ldpi"  
fi

xcf2png $filename.xcf -o $2/png/$filename.png
convert $2/png/$filename.png -resize 96x96 $2/xhdpi/$filename.png
convert $2/png/$filename.png -resize 72x72 $2/hdpi/$filename.png
convert $2/png/$filename.png -resize 48x48 $2/mdpi/$filename.png
convert $2/png/$filename.png -resize 32x32 $2/ldpi/$filename.png
