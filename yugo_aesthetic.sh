#!/bin/bash

# Variables

CURRENT_DATE=$(date -d '-30 years' +%b.%d' '%Y)
INPUT="$1"
OUTPUT="$2"
MESSAGE="$3"

# Default messag
if [ -z "$MESSAGE" ]; then
	MESSAGE='Y U G O S L A V I A !'
fi


convert -size 800x200 xc:transparent -font /usr/share/fonts/VCR_OSD_MONO_1.001.ttf -pointsize 52 \
        -draw "gravity southeast \
        fill pink text 13,72 '$MESSAGE' \
        fill pink text 11,74 '$MESSAGE' \
        fill yellow text 11,72 '$MESSAGE' \
        fill white skewX 2 text 10,72 '$MESSAGE' \
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
