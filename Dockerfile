FROM debian:stable
MAINTAINER Konrad Lother <k@hiddenbox.org>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://httpredir.debian.org/debian/ stable main non-free contrib" >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get -y upgrade && apt-get -y dist-upgrade 

RUN apt-get install -y ca-certificates git

RUN apt-get install -y \
	python \
	python-django \
	python-pyxmpp \
	python-crypto \
	python-pycurl \
	python-imaging \
	python-beaker \
	python-qt4 \
	rhino \
	tesseract-ocr \
	tesseract-ocr-eng \
	gocr \
	unrar
RUN apt-get install -y \
	python-openssl
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN git clone https://github.com/pyload/pyload /opt/pyload

EXPOSE 8000
EXPOSE 9666

COPY pyload-config /tmp/pyload-config

ADD run.sh /run.sh

VOLUME /root/.pyload
VOLUME /opt/pyload/Downloads

CMD /run.sh
