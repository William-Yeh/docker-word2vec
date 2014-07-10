# word2vec for Debian jessie
#
# URL: https://github.com/William-Yeh/docker-word2vec
#
# Reference: https://code.google.com/p/word2vec/
# See also:  https://github.com/William-Yeh/word2vec-mac
#
# Version     0.1
#

# pull base image
FROM debian:jessie
MAINTAINER William Yeh <william.pjyeh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update

# Install svn & compilation tools
RUN apt-get install -y \
      subversion  \
      make \
      gcc  \
      curl


RUN mkdir -p /opt/word2vec
WORKDIR /opt/word2vec


# compile
RUN \
    svn checkout http://word2vec.googlecode.com/svn/trunk/  && \
    cd trunk  && \
    sed -i -e \
        's/TrainModel();/if (vocab_hash == 0) { printf("ERROR: no enough memory; should be >= %zu bytes.", vocab_hash_size * sizeof(int)); } else { TrainModel(); } \/\/ avoid "segmentation fault" error/' \
        word2phrase.c  && \
    make

# [FYI] Segmentation fault of word2phrase
# @see https://groups.google.com/forum/#!topic/word2vec-toolkit/9RvNwbsDCS4
#
#--> sed -i -e 's/-march=native/-march=x86-64 -mtune=generic/' makefile


# download demo corpus for convenience
RUN \
    mkdir -p demo   && \
    cd demo         && \
    curl -O http://mattmahoney.net/dc/text8.zip


# Uninstall svn & compilation tools
RUN apt-get remove -y --auto-remove subversion make gcc curl && \
    apt-get clean



# move binary to public accessible directory
RUN mv trunk/compute-accuracy .  && \
    mv trunk/distance         .  && \
    mv trunk/word-analogy     .  && \
    mv trunk/word2phrase      .  && \
    mv trunk/word2vec         .  && \
    mv trunk/questions-*.txt  demo 

# copy modified demo scripts
COPY demo /opt/word2vec/demo


# clean up
RUN rm -rf trunk

#----------------------------#

# configure
VOLUME [ "/data" ]
WORKDIR /data


# for convenience
ENV WORD2VEC_PATH   /opt/word2vec
ENV PATH /opt/word2vec:/opt/word2vec/demo:$PATH
COPY usage.sh  /opt/word2vec/
RUN date '+%Y-%m-%dT%H:%M:%S%:z' > /var/log/DOCKER_BUILD_TIME


# Define default command.
CMD ["usage.sh"]
