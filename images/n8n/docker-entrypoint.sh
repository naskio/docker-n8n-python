#!/bin/sh

if [ -d /home/node/custom/.n8n/nodes/ ] ; then
  chmod o+rx /home/node/custom
  chown -R node /home/node/custom/.n8n/
  ln -s /home/node/custom/.n8n/nodes/ /home/node/.n8n/
fi

chown -R node /home/node

if [ "$#" -gt 0 ]; then
  # Got started with arguments
  exec su-exec node "$@"
else
  # Got started without arguments
  exec su-exec node n8n
fi
