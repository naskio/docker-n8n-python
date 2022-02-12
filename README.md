# n8n - docker image with Python 3.10 and custom node PythonFunction

![n8n.io - Workflow Automation](https://raw.githubusercontent.com/n8n-io/n8n/master/assets/n8n-logo.png)

This [image](https://hub.docker.com/r/naskio/n8n-python) includes Python 3.10 by default. it can be used to run python
scripts inside n8n using the [Execute Command](https://docs.n8n.io/nodes/n8n-nodes-base.executeCommand/) node or code
snippets using the custom node [Python Function](https://www.github.com/naskio/n8n-nodes-python).

> Run python 3.10 code on n8n.

[Docker Hub](https://hub.docker.com/r/naskio/n8n-python)

[GitHub repository](https://www.github.com/naskio/docker-n8n-python)

## Image Setup

Using docker compose
[docker-compose.yml](./demo/docker-compose-local.yml)

## Usage

### Run Python Code

The image includes the custom module [n8n-nodes-python](https://www.github.com/naskio/n8n-nodes-python) by default.

We can use this custom node [Python Function](https://www.github.com/naskio/n8n-nodes-python) to run a python code over
the `items` (works the same way as [Function](https://docs.n8n.io/nodes/n8n-nodes-base.function) node)

[Python Function node docs](https://www.github.com/naskio/n8n-nodes-python)

### Run mounted Python scripts using the ExecuteCommand node

You can run `*.py`files that has been mounted to the container using
the [ExecuteCommand](https://docs.n8n.io/nodes/n8n-nodes-base.executeCommand/) node.

### Installing external packages

The [ExecuteCommand](https://docs.n8n.io/nodes/n8n-nodes-base.executeCommand/) node can be used to install python
packages or install dependencies from a mounted `requirements.txt` file to the container.

It can be combined with [n8nTrigger](https://docs.n8n.io/nodes/n8n-nodes-base.n8nTrigger) to install packages directly
after starting the container.

> Once the packages are installed, it can be used in the Python Function node. `import <package>`

## Documentation

The official n8n documentation can be found under: [https://docs.n8n.io](https://docs.n8n.io)

Additional information and example workflows on the n8n.io website: [https://n8n.io](https://n8n.io)

Learn [how to run n8n in **Docker**](https://github.com/n8n-io/n8n/tree/master/docker/images/n8n/README.md)