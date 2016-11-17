#!/bin/bash
varnishd -f $VCL_CONFIG -s malloc,$CACHE_SIZE $VARNISHD_PARAMS

file_count=0
while [[ $file_count -le 0 ]]; do
  file_count=$(find /var/lib/varnish -name _.vsm | wc -l)
  echo "Waiting for Varnish response..."
  sleep 2
done

echo "Starting Varnish logging"

varnishncsa
