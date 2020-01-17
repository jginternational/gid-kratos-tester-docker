
FROM thewtex/opengl


WORKDIR /app
RUN apt-get update
RUN apt-get -y install tcl
RUN apt-get -y install git

RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN apt-get -y install nodejs

RUN mkdir scripts
COPY ./install-gid.sh "scripts/install-gid.sh"
RUN chmod 750 "scripts/install-gid.sh"
RUN "scripts/install-gid.sh"
COPY ./install-kratos.sh "scripts/install-kratos.sh"
RUN chmod 750 "scripts/install-kratos.sh"
RUN "scripts/install-kratos.sh"
