
FROM phusion/baseimage:0.9.22
MAINTAINER epflsti <stiitdev@groupes.epfl.ch>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TZ=Europe/Madrid
ENV SCREEN_RESOLUTION 1280x800

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## # Add the octave repo
## RUN add-apt-repository ppa:octave/stable

# Installing apps (Note: git is here just in case noVNC needs it in launch.sh
RUN apt-get update && apt-get -y install \
	xvfb \
	x11vnc \
	supervisor \
	fluxbox \
	net-tools \
	git-core \
	git \
	wget \
        xz-utils \
	curl \
        libglu1-mesa \
        libharfbuzz0b
	
#	x11-xserver-utils

# octave
# x11-server-utils to install  xrandr

# House cleaning
RUN apt-get autoclean

# Docker's supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set display
ENV DISPLAY :0

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