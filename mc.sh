#!/bin/sh

prog=${0##*/}
if [ $# != 1 ]; then
  echo "usage: ${prog} filename" >&2
  exit 1
fi

o=`echo $1 | sed 's/\.mp4/.m4a/'`
mv ${1} ${o}
AtomicParsley ${o} --manualAtomRemove "moov.meta" --overWrite

# EOF
