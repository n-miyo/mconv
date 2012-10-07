#!/bin/sh
#
# Licese: MIT License

TEMPLATENAME='mconv.tmpl.applescript'
PROGNAME='convert - mora files to iOS compat.scpt'
SCRIPTDIR="${HOME}/Library/Scripts/Folder Action Scripts"

CONVERTER='AtomicParsley'
CONVERTERDIRS="/usr/local/bin /opt/local/bin"

p=`which ${CONVERTER}`
if [ ${p}x = x ]; then
  for d in ${CONVERTERDIRS}; do
      p="${d}/${CONVERTER}"
      [ -e ${p} ] && break
  done
fi

if [ ! -e ${p} ]; then
  echo "Error: ${CONVERTER}: No such file" 2>&1
  exit 1
fi

mkdir -p "${SCRIPTDIR}"
sed "s#%ATOMICPARSLEYCMD%#${p}#" < ${TEMPLATENAME} | \
  osacompile -o "${SCRIPTDIR}/${PROGNAME}" -x

echo 'done'

# EOF
