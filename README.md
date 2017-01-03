# Docker for Presto

## Introduction

This project can help to build a Docker image for Presto, forked from https://github.com/medined/docker-presto.git. 
See http://prestodb.io/ for more information.  Currently, it only supports local file connection.

## Getting it

### Downloading 
  https://hub.docker.com/r/timiblossom/presto-local-file/

### Building

```
git clone https://github.com/timiblossom/docker-presto
cd docker-presto
wget http://central.maven.org/maven2/com/facebook/presto/presto-server/0.161/presto-server-0.161.tar.gz

Build image:
  docker build -t presto-local-file .

Run image:
  ./run_image.sh
```

Once inside a container of this image, run the following to start Presto:

```
  /configure.sh
```

You can see what URL and PORT is being used by Presto this way:

```
  ./what-is-ui-url.sh
```

## Accessing with Presto client:
  ./presto --server <docker-ip>:8080 --catalog localfile 
   
  presto> use logs;
  presto:logs> select count(*) from http_request_log;

