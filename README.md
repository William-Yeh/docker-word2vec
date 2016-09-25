Docker-word2vec
===============


## Summary

Repository name in Docker Hub: **[williamyeh/word2vec](https://registry.hub.docker.com/u/williamyeh/word2vec/)**

This repository contains Dockerized [word2vec](https://code.google.com/p/word2vec/) application, published to the public [Docker Hub](https://registry.hub.docker.com/) via **automated build** mechanism.



## Configuration

This docker image contains the following software stack:

- OS: Debian jessie (built from [debian:jessie](https://registry.hub.docker.com/_/debian/)).

- word2vec


### Dependencies

- [debian:jessie](https://registry.hub.docker.com/_/debian/).


### History

- 0.1 - Initial release. Compiled according to [r37](https://code.google.com/p/word2vec/source/detail?r=37) (revision date: Dec 18, 2013).



## Installation

```shell
docker pull williamyeh/word2vec
```


## Usage


#### Show usage

```shell
$ docker run --rm williamyeh/word2vec
```



## For more information

Of course, official [word2vec](https://code.google.com/p/word2vec/) page hosted at Google Code.


## License

[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0), same as original project.
