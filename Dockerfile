FROM alpine

COPY default.vcl /etc/varnish/default.vcl

ENV VCL_CONFIG="/etc/varnish/default.vcl"
ENV CACHE_SIZE="64m" 
ENV VARNISHD_PARAMS="-p default_ttl=3600 -p default_grace=3600"

RUN apk add --no-cache varnish

EXPOSE 6081

CMD varnishd -F -f $VCL_CONFIG -s malloc,$CACHE_SIZE $VARNISHD_PARAMS
