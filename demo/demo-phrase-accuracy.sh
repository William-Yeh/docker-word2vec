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

echo ----------------------------------------------------------------------------------------------------------------
echo Note that the accuracy and coverage of the test set questions is going to be low with this small training corpus
echo To achieve better accuracy, larger training set is needed
echo ----------------------------------------------------------------------------------------------------------------

time word2phrase \
  -train /data/text8 -output /data/text8-phrase \
  -threshold 500 -debug 2 -min-count 3

time word2vec \
  -train /data/text8-phrase -output data/vectors-phrase.bin \
  -cbow 0 -size 300 -window 10 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1 -min-count 3

compute-accuracy /data/vectors-phrase.bin < $SCRIPT_DIR/questions-phrases.txt
