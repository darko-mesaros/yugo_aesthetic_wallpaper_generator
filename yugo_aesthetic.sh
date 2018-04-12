#!/bin/bash

# Variables

CURRENT_DATE=$(date +%b.%d' '%Y)
INPUT="$1"
OUTPUT="$2"

convert -size 500x200 xc:transparent -font /usr/share/fonts/VCR_OSD_MONO_1.001.ttf -pointsize 52 \
        -draw "gravity southeast \
        fill pink text 13,72 'Y U G O !' \
        fill pink text 11,74 'Y U G O !' \
        fill yellow text 11,72 'Y U G O !' \
        fill white skewX 2 text 10,72 'Y U G O !' \
        fill pink text 12,12 '$CURRENT_DATE' \
        fill pink text 11,14 '$CURRENT_DATE' \
        fill yellow text 11,12 '$CURRENT_DATE' \
        fill white skewX -3 text 10,12 '$CURRENT_DATE' "\
	-motion-blur 0x3+180 \
	-rotate -90 \
	-wave 0.2x5\
	-rotate 90 \
        /tmp/tmp_wp.png 
composite -gravity southeast /tmp/tmp_wp.png $INPUT $OUTPUT
