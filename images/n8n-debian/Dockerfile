FROM nikolaik/python-nodejs:python3.12-nodejs20

# changing user `pn` to `node`
RUN usermod --login node --move-home --home /home/node pn
RUN groupmod --new-name node pn

ARG N8N_VERSION

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

RUN \
	apt-get update && \
	apt-get -y install graphicsmagick gosu git

# Install python requirements
RUN mkdir /requirements
COPY requirements.txt /requirements/requirements.txt
RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install -r /requirements/requirements.txt

# Set a custom user to not have n8n run as root
USER root

RUN npm_config_user=root npm install -g full-icu n8n@${N8N_VERSION}

# Install n8n-nodes-python module with legacy peer deps to resolve dependency conflicts
RUN N8N_PATH=$(find /usr -name "n8n" -type d -path "*/node_modules/n8n" 2>/dev/null | head -1) && \
    if [ -n "$N8N_PATH" ] && [ -d "$N8N_PATH" ]; then \
      echo "Found n8n at: $N8N_PATH" && \
      cd "$N8N_PATH" && npm install n8n-nodes-python --legacy-peer-deps; \
    else \
      echo "Error: n8n directory not found in node_modules" && exit 1; \
    fi

ENV NODE_ICU_DATA=/usr/lib/node_modules/full-icu

WORKDIR /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5678/tcp
