FROM alpine:3.5
MAINTAINER Konrad Lother <k@hiddenbox.org>

RUN apk add --no-cache \
            bash \
            python \
            py2-pip \
            py2-crypto \
            py2-curl \
            bzip2 \
            tar \
            unzip \
            gzip \
            unrar \
            wget \
            git \
 && pip install --upgrade pip \
 && mkdir -p /opt/download \
 && mkdir -p /opt/config \
 && mkdir -p /opt/ \
 && ln -s /opt/config /root/.pyload

RUN git clone https://github.com/pyload/pyload /opt/pyload \
 && cd /opt/pyload \
 && git checkout stable 

COPY pyload-config /tmp/pyload-config

ADD run.sh /run.sh

ENTRYPOINT ["/run.sh"]
