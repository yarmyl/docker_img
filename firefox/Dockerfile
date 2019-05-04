FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

COPY run_firefox /bin/

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    chmod +x /bin/run_firefox && \
    apt-get install locales

ENV LANGUAGE ru_RU.UTF-8

ENV LANG ru_RU.UTF-8

ENV LC_ALL ru_RU.UTF-8

RUN locale-gen ru_RU.UTF-8 && \
    dpkg-reconfigure locales && \ 
    apt-get install -y --no-install-recommends dbus-x11 libexif12 && \
    apt-get update && \
    apt-get install -y firefox-esr && \
    apt-get clean -y && \
    groupadd --gid 9999 docker && \
    useradd --password='' --uid=9999 --gid=docker --shell=/bin/bash --create-home docker

CMD /bin/run_firefox
