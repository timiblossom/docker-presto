#
# Presto DB
#

FROM openjdk:8

MAINTAINER Minh Do "minh.n.do@gmail.com"

RUN apt-get install -y python

ADD configure.sh /
ADD presto-server-0.161.tar.gz /

RUN mkdir -p /var/lib/presto/data
RUN mkdir -p /presto-server-0.161/etc

EXPOSE 8080

WORKDIR /presto-server-0.161
#ENTRYPOINT ["/run.sh"]
