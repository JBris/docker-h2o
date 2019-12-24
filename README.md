Docker for H2O
=====

See [https://hub.docker.com/r/codelibs/h2o/](https://hub.docker.com/r/codelibs/h2o/).

## Docker Images

-   [`3.28.0.1`](https://github.com/codelibs/docker-h2o/blob/master/Dockerfile)

## Getting Started

You can access http://localhost:54321 from the host OS with:

```console
$ docker run -it -p 54321:54321 codelibs/h2o:3.28.0.1
```

## Build


To build docker images, run as below:

```console
$ docker build --rm -t codelibs/h2o:<tag name> .
```

