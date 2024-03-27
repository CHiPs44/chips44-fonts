#!/usr/bin/env bash

# set -x
JAR=~/bin/BitsNPicas.jar

for KBITX in source/*.kbitx; do
    BASENAME=$(basename -s ".kbitx" ${KBITX})
    FONTX2="fontx2/${BASENAME}.fnt"
    HEADER="include/${BASENAME}.h"

    if [[ -f ${FONTX2} ]]; then
        rm -f ${FONTX2}
    fi
    if [[ "${FONTX2}" == *"unicode"* ]]; then
        java -jar ${JAR} convertbitmap -f fontx2 -ee UTF-16 -o ${FONTX2} ${KBITX}
    else
        java -jar ${JAR} convertbitmap -f fontx2 -o ${FONTX2} ${KBITX}
    fi
    xxd -i -c 16 ${FONTX2} | sed "s/_fnt\[\]/\[\]/g" | sed "s/_fnt_len\[\]/_len\[\]/g" > ${HEADER}
done

# EOF
