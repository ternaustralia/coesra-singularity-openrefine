# coesra-singularity-openrefine

The main idea of this repository is to build the `Openrefine` application in a docker container and then convert it into Singularity. The following commands and rools are require to be able to build the docker image and then build the singularity image.

### Require Tools
- [docker](https://docs.docker.com/get-docker/)
- [Docker2Singularity](https://github.com/singularityhub/docker2singularity)

### Build docker image
```
docker build . -t openrefine:3.4.1
```

### Run in local with docker
```
docker run --rm --name openrefine -it openrefine:3.4.1
```
- Now open your browserin [localhost](http://127.0.0.1:3333)

### Docker2Singularity
The following command will generate a `file.simg`, and it is what you need to run with singularity.
```
docker run \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/<OUTPUT_PATH>:/output \
    --privileged -t --rm \
    singularityware/docker2singularity \
    --name <OUTPUT_NAME> openrefine:3.4.1
```

