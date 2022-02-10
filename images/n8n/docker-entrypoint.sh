#!/bin/sh

if [ -d /root/.n8n ] ; then
  chmod o+rx /root
  chown -R pn /root/.n8n
  ln -s /root/.n8n /home/pn/
fi

chown -R pn /home/pn

if [ "$#" -gt 0 ]; then
  # Got started with arguments
  exec su-exec pn "$@"
else
  # Got started without arguments
  exec su-exec pn n8n
fi
