docker-presto
==============


This project containerizes Presto, forked from https://github.com/medined/docker-presto.git. 
See http://prestodb.io/ for more information.

```
Prerequisite:

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

Run shell Presto client:
  ./presto --server <docker-ip>:8080 --catalog localfile 

# Important Note

This demonstrates Presto's localfile connector
