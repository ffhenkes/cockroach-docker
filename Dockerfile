FROM debian

MAINTAINER Fabio Favero Henkes <fabio.favero@gmail.com>

ENV VERSION latest
ENV ARCH linux-amd64

ADD ./docker-entrypoint.sh /entrypoint.sh

RUN \
    apt-get update \
    && apt-get install -qqy curl \
    && curl -O -# https://binaries.cockroachdb.com/cockroach-${VERSION}.${ARCH}.tgz \
    && tar -zxvf cockroach-${VERSION}.${ARCH}.tgz \
    && mv -f cockroach-${VERSION}.${ARCH}/cockroach /usr/bin/cockroach \
    && rm -rf cockroach-${VERSION}.${ARCH} \
    && rm -f cockroach-${VERSION}.${ARCH}.tgz

RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
