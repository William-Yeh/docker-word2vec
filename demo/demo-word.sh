#!/bin/bash

#
# "/data" directory is exposed by Dockerfile:
#
#   - VOLUME [ "/data" ]
#   - WORKDIR /data
#

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
#echo $SCRIPT_DIR

if [ ! -e /data/text8 ]; then
  #curl -o /data/text8.zip http://mattmahoney.net/dc/text8.zip
  gzip -d --stdout -S .zip $SCRIPT_DIR/text8.zip -f > /data/text8
fi

time word2vec \
  -train /data/text8 -output /data/vectors.bin \
  -cbow 0 -size 200 -window 5 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1

distance /data/vectors.bin