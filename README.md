# Postfix

These are docker images for Postfix running on an
[Alpine Linux container](https://registry.hub.docker.com/u/webhippie/alpine/).


## Usage

```
docker run -ti --name postfix webhippie/postfix:latest
```


## Versions

* [latest](https://github.com/dockhippie/postfix/tree/master)
  available as ```webhippie/postfix:latest``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/postfix/)










## Available environment variables

```bash
ENV DISCOVERY_TYPE etcd
ENV DISCOVERY_HOST 127.0.0.1
ENV DISCOVERY_PORT 4001
ENV DISCOVERY_INTERVAL 30
ENV DISCOVERY_PREFIX /
ENV DISCOVERY_OPTS # Optional, any allowed confd param
ENV DISCOVERY_CLIENT_KEY # Optional, as string or filename
ENV DISCOVERY_CLIENT_CERT # Optional, as string or filename
ENV DISCOVERY_CLIENT_CA # Optional, as string or filename
```


### Configure with etcd

If you export ```DISCOVERY_TYPE``` with the value ```etcd``` you can use etcd
for configuration:

```
etcdctl set /config/loglevel 'debug'
etcdctl set /config/layerinfo 'inmemory'
etcdctl set /config/secret 'secret1234567890'
etcdctl set /redis/host 'localhost'
etcdctl set /redis/port '6379'
etcdctl set /endpoints/app1/url 'http://localhost:5003/callback'
etcdctl set /endpoints/app1/url 'http://localhost:8080/callback'
```


### Configure with consul

If you export ```DISCOVERY_TYPE``` with the value ```consul``` you can use
consul for configuration:

```
curl -X PUT -d 'debug' http://localhost:8500/v1/kv/config/loglevel
curl -X PUT -d 'inmemory' http://localhost:8500/v1/kv/config/layerinfo
curl -X PUT -d 'secret1234567890' http://localhost:8500/v1/kv/config/secret
curl -X PUT -d 'localhost' http://localhost:8500/v1/kv/redis/host
curl -X PUT -d '6379' http://localhost:8500/v1/kv/redis/port
curl -X PUT -d 'http://localhost:5003/callback' http://localhost:8500/v1/kv/endpoints/app1/url
curl -X PUT -d 'http://localhost:8080/callback' http://localhost:8500/v1/kv/endpoints/app1/url
```


### Configure with environment

If you export ```DISCOVERY_TYPE``` with the value ```env``` you can use
environment for configuration:

```
export CONFIG_LOGLEVEL=debug
export CONFIG_LAYERINFO=inmemory
export CONFIG_SECRET=secret1234567890
export REDIS_HOST=localhost
export REDIS_PORT=6379
export ENDPOINTS_APP1_URL=http://localhost:5003/callback
export ENDPOINTS_APP2_URL=http://localhost:8080/callback
```









## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

```
Copyright (c) 2015 Thomas Boerger <http://www.webhippie.de>
```
