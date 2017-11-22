# Varnish

This container contains Varnish 5 on top of Alpine Linux.

## Configuring Varnish
Create a new VCL file for your requirements, using the docker service name for your host. The following in an example
configuration for a simple backend that is listening on port `8080` for a service called `backend`.

```vcl
vcl 4.0;

backend default {
    .host = "backend";
    .port = "8080";
}
```

## Environment Variables

| Environment Variable | Default Value | Description |
| --- | --- | --- |
| `VCL_CONFIG` | `/etc/varnish/default.vcl` | The path to your VCL file |
| `CACHE_SIZE` | `64m` | The amount of storage to use for your cache |
| `VARNISHD_PARAMS` | `-p default_ttl=3600 -p default_grace=3600` | The params to run `varnishd` with |
