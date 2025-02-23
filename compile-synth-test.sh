#!/bin/sh

DNLOAD="../dnload/dnload.py"
if [ ! -f "${DNLOAD}" ] ; then
    DNLOAD="../faemiyah-demoscene/dnload/dnload.py"
    if [ ! -f "${DNLOAD}" ] ; then
        DNLOAD="/usr/local/src/dnload/dnload.py"
        if [ ! -f "${DNLOAD}" ] ; then
            DNLOAD="/usr/local/src/faemiyah-demoscene/dnload/dnload.py"
            if [ ! -f "${DNLOAD}" ] ; then
                echo "${0}: could not find dnload.py"
                exit 1
            fi
        fi
    fi
fi

if [ ! -f "src/dnload.h" ] ; then
  touch src/dnload.h
fi

python3 "${DNLOAD}" -v src/synth.asm src/synth-test.cpp --hash=crc32 -F header --32 -o synth-test $*
if [ $? -ne 0 ] ; then
    echo "${0}: compilation failed"
    exit 1
fi

exit 0
