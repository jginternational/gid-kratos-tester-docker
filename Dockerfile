FROM node:buster

WORKDIR /app
RUN apt-get update
RUN apt-get -y install tcl
RUN apt-get -y install git
RUN mkdir scripts
COPY ./install-gid.sh "scripts/install-gid.sh"
RUN chmod 750 "scripts/install-gid.sh"
RUN "scripts/install-gid.sh"
COPY ./install-kratos.sh "scripts/install-kratos.sh"
RUN chmod 750 "scripts/install-kratos.sh"
RUN "scripts/install-kratos.sh"