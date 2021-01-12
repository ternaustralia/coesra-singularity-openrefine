FROM ubuntu:18.04

ENV OPENREFINE_PATH=/opt/openrefine-3.1
RUN export PATH=$OPENREFINE_PATH:$PATH

COPY startopenrefine.sh .

RUN apt update -y && \
  apt-get install -y software-properties-common wget locales default-jre firefox && \
  locale-gen en_AU.UTF-8

RUN cd /opt && \
  wget -O openrefine-linux-3.1.tar.gz https://github.com/OpenRefine/OpenRefine/releases/download/3.1/openrefine-linux-3.1.tar.gz && \
  tar -zxvf openrefine-linux-3.1.tar.gz && \
  ln -s openrefine-3.1 openrefine
  
ENTRYPOINT exec /bin/bash /startopenrefine.sh