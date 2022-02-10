#!/bin/sh

if [ -d /root/.n8n ] ; then
  chmod o+rx /root
  chown -R pn /root/.n8n
  ln -s /root/.n8n /home/pn/
fi

if [ "$#" -gt 0 ]; then
  # Got started with arguments
  exec gosu pn "$@"
else
  # Got started without arguments
  exec gosu pn n8n
fi
