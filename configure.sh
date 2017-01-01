#!/bin/bash

NODE_UUID=$(cat /proc/sys/kernel/random/uuid)
PRESTO_HOME="/presto-server-0.161"

cat << EOF > $PRESTO_HOME/etc/node.properties
node.environment=development
node.id=$NODE_UUID
node.data-dir=/var/lib/presto/data
EOF

cat << EOF > $PRESTO_HOME/etc/jvm.config
-server
-Xmx1024M
-XX:+UseConcMarkSweepGC
-XX:+ExplicitGCInvokesConcurrent
-XX:+CMSClassUnloadingEnabled
-XX:+AggressiveOpts
-XX:+HeapDumpOnOutOfMemoryError
-XX:PermSize=150M
-XX:MaxPermSize=150M
-XX:OnOutOfMemoryError=kill -9 %p
-XX:ReservedCodeCacheSize=150M
-Xbootclasspath/p:/presto-server-0.161/lib/floatingdecimal-0.1.jar
EOF

cat << EOF > $PRESTO_HOME/etc/config.properties
coordinator=true
node-scheduler.include-coordinator=true
http-server.http.port=8080
discovery-server.enabled=true
discovery.uri=http://localhost:8080
EOF

cat << EOF > $PRESTO_HOME/etc/log.properties
com.facebook.presto=INFO
EOF

echo "Presto configured"
echo "  NODE ID: $NODE_UUID"

echo "Create localfile configuration"

mkdir $PRESTO_HOME/etc/catalog
cat << EOF > $PRESTO_HOME/etc/catalog/localfile.properties
connector.name=localfile
EOF


bin/launcher run
