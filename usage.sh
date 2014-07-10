#!/bin/bash


TIMESTAMP=`cat /var/log/DOCKER_BUILD_TIME`


cat << EOF

williamyeh/docker-word2vec - Docker image for word2vec.
Image built at: $TIMESTAMP

Env
===

- Exported volumes:

    * [IN,OUT] /data - for corpus & model files.


Usage
=====

## Demo: word distance

  Cmd:  demo-word.sh

  Examples:

    # use current directory "\$(pwd)" for corpus and model.
    $ docker run -it --rm  \\
        -v \$(pwd):/data    \\
        williamyeh/docker-word2vec  demo-word.sh


## Demo: phrase distance

  Cmd:  demo-phrases.sh

  Examples:

    # use current directory "\$(pwd)" for corpus and model.
    # [NOTE] free memory should be > 2 GiB for this task.
    $ docker run -it --rm  \\
        -v \$(pwd):/data    \\
        williamyeh/docker-word2vec  demo-phrases.sh


## Demo: word clustering

  Cmd:  demo-classes.sh

  Examples:

    # use current directory "\$(pwd)" for corpus and model.
    $ docker run -it --rm  \\
        -v \$(pwd):/data    \\
        williamyeh/docker-word2vec  demo-classes.sh


## List all demos available:

    $ docker run --rm  \\
        williamyeh/docker-word2vec  ls -al /opt/word2vec/demo


## List all native executables available:

    $ docker run --rm  \\
        williamyeh/docker-word2vec  ls -al /opt/word2vec



More Info
=========

For more info, see official word2vec site:

    https://code.google.com/p/word2vec/



EOF
