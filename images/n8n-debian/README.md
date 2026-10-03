## n8n - Debian Docker Image

Dockerfile to build n8n with Debian.

For information about how to run n8n with Docker check the generic
[Docker-Readme](https://github.com/n8n-io/n8n/tree/master/docker/images/n8n/README.md)


```

# For example:
docker build --build-arg N8N_VERSION=1.37.3 -t n8nio/n8n:1.37.3-debian .
```

```
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  n8nio/n8n:1.37.3-debian
```
