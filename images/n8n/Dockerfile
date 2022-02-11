FROM nikolaik/python-nodejs:python3.10-nodejs14-alpine

# changing user `pn` to `node`
RUN deluser pn && rm -r /home/pn # delete: user + group
RUN addgroup -g 1000 -S node && adduser -u 1000 -S node -G node -s /bin/sh # create: user + group

ARG N8N_VERSION

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata git tini su-exec

# # Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies build-base ca-certificates && \
	npm_config_user=root npm install -g full-icu n8n@${N8N_VERSION} && \
	apk del build-dependencies \
	&& rm -rf /root /tmp/* /var/cache/apk/* && mkdir /root;

# Install n8n-nodes-python module
RUN cd /usr/local/lib/node_modules/n8n && npm install n8n-nodes-python

# Install fonts
RUN apk --no-cache add --virtual fonts msttcorefonts-installer fontconfig && \
	update-ms-fonts && \
	fc-cache -f && \
	apk del fonts && \
	find  /usr/share/fonts/truetype/msttcorefonts/ -type l -exec unlink {} \; \
	&& rm -rf /root /tmp/* /var/cache/apk/* && mkdir /root

# (note: use debian instead of alpine if you want to use Pandas or heavy libraries)
# Install Python Development Tools (disabled)
# RUN apk update && apk --no-cache add make automake gcc g++ subversion python3-dev
# RUN apk update && apk --no-cache add musl-dev linux-headers g++
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk --no-cache --update-cache add gfortran build-base wget freetype-dev libpng-dev openblas-dev
# RUN apk --no-cache --update-cache add wget libgfortran musl-dev linux-headers

# Install python requirements
RUN mkdir /requirements
COPY requirements.txt /requirements/requirements.txt
RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install -r /requirements/requirements.txt

ENV NODE_ICU_DATA /usr/local/lib/node_modules/full-icu

WORKDIR /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

EXPOSE 5678/tcp
