FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive.

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y language-pack-ru

ENV LANGUAGE ru_RU.UTF-8

ENV LANG ru_RU.UTF-8

ENV LC_ALL ru_RU.UTF-8

RUN locale-gen ru_RU.UTF-8 && \
    dpkg-reconfigure locales && \
    apt-get update && \
    apt-get install -y firefox

CMD /usr/bin/firefox
