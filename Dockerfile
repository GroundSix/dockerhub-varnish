FROM debian:latest

MAINTAINER Anthony Porthouse <anthony.porthouse@groundsix.com>

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y curl \
  && curl -O https://repo.varnish-cache.org/pkg/5.0.0/varnish_5.0.0-1_amd64.deb \
  && (dpkg -i varnish_5.0.0-1_amd64.deb 2> /dev/null || true) \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yf \
  && rm varnish_5.0.0-1_amd64.deb \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 6081

ENV VCL_CONFIG /etc/varnish/default.vcl
ENV CACHE_SIZE 64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

ADD start.sh /usr/local/bin/start

CMD ["start"]
