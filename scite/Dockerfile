FROM ubuntu:bionic

RUN apt-get update && \
  apt-get install -y scite libcanberra-gtk-module && \
  apt-get install -y python3 && \
  apt-get install -y python3-pip && \
  pip3 install pycodestyle && \
  pip3 install autopep8 && \
  apt-get clean -y && \
  groupadd --gid 9999 docker && \
  useradd --password='' --uid=9999 --gid=docker --shell=/bin/bash --create-home docker

COPY scite.sh /bin/

RUN chmod +x /bin/scite.sh

COPY python.api /usr/share/scite/
COPY python.properties /usr/share/scite/

ENTRYPOINT ["/bin/scite.sh"]
#CMD ["/bin/scite.sh"]
