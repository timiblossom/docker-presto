#!/bin/bash

PRESTO_PORT=`cat presto_port`

docker run -p $PRESTO_PORT:8080 -i -t presto-local-file /bin/bash
