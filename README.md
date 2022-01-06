# docker-n8n-python

Docker Compose configuration file for n8n with Python, ready to use

## prerequisites

- [Postgres](https://hub.docker.com/r/postgres/)
- jwilder/nginx-proxy

## Step-by-step instructions

- Configure `.env` file
- Run `docker-compose up -d`
- In order to run python scripts inside n8n
  ```shell
  cd /py_scripts
  cd /files
  cat /requirements/requirements.txt
  ```

## Further information

Read more
at [n8n.io](https://docs.n8n.io/getting-started/installation/advanced/server-setup.html#docker-compose-example)
, [here](https://github.com/n8n-io/n8n/blob/master/docker/compose/withPostgres/docker-compose.yml)
or [here](https://github.com/n8n-io/n8n/blob/master/docker/images/n8n/README.md)

for additional information about adding Python to n8n:

- [Discussion](https://community.n8n.io/t/run-shell-script/2073)
- [Discussion](https://community.n8n.io/t/running-a-python-script-thats-in-a-virtualenv/6354)
- [Discussion](https://community.n8n.io/t/running-python-with-n8n/5715/7)
