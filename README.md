Docker-word2vec
===============


## Summary

Repository name in Docker Hub: **[williamyeh/docker-word2vec](https://registry.hub.docker.com/u/williamyeh/docker-word2vec/)**

This repository contains **Dockerfile** of [word2vec](https://code.google.com/p/word2vec/) for [Docker](http://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/williamyeh/docker-word2vec/) published to the public [Docker Hub](https://hub.docker.com/).





## Configuration

This docker image contains the following software stack:

- OS: Debian jessie (built from [debian:jessie](https://registry.hub.docker.com/_/debian/)).

- word2vec


### Dependencies

- [debian:jessie](https://registry.hub.docker.com/_/debian/).


### History

- 0.1 - Initial release. Compiled according to [r37](https://code.google.com/p/word2vec/source/detail?r=37) (revision date: Dec 18, 2013).



## Installation on Docker-friendly OS

If you're using a Docker-friendly OS (e.g., CoreOS, Debian, Ubuntu) or Windows/MacOSX powered by [boot2docker](http://boot2docker.io/):

1. Install [Docker](http://www.docker.com/), if necessary.

2. Download this [automated build](https://registry.hub.docker.com/u/williamyeh/docker-word2vec/) from public [Docker Hub](https://registry.hub.docker.com/):

   ```
   $ docker pull williamyeh/docker-word2vec
   ```

   (alternatively, you can build an image from Dockerfile: `docker build -t="williamyeh/docker-word2vec" github.com/William-Yeh/docker-word2vec`)



## Installation on Vagrant


### For the impatient

1. Copy the `Vagrantfile` of this project to your working directory.

2. Initialize and ssh into the Vagrant box:

   ```
   $ vagrant up
   $ vagrant ssh
   ```




### "Docker" provider

If you'd like to use the [Docker provider feature](https://www.vagrantup.com/blog/feature-preview-vagrant-1-6-docker-dev-environments.html) introduced since Vagrant 1.6:

1. Place a `Vagrantfile` in your working directory like this:

   ```
   VAGRANTFILE_API_VERSION = "2"
   DOCKER_IMAGE = "williamyeh/docker-word2vec"

   Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
       config.vm.define #{DOCKER_IMAGE} do |v|
           v.vm.provider "docker" do |d|
               d.image = #{DOCKER_IMAGE}
           end
       end
   end
   ```


2. Initialize the Docker container (with an implicit Vagrant box such as [mitchellh/boot2docker](https://github.com/mitchellh/boot2docker-vagrant-box), if necessary):

   ```
   $ vagrant up --provider=docker
   ``` 

3. See if Docker runs successfully:

   ```
   $ vagrant docker-logs
   ```


Vagrant 1.6 has also introduced Docker-related commands (e.g., `docker-logs` & `docker-run`). Consult the [official document](https://docs.vagrantup.com/v2/docker/commands.html) for more details.






## Usage


#### Show usage

```
$ docker run --rm williamyeh/docker-word2vec
```



## For more information

Of course, official [word2vec](https://code.google.com/p/word2vec/) page hosted at Google Code.


## License

[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0), same as original project.