# Urban Octo Meme

A test example of using the Red Hat Universal Base Image as a basis for
containerized apps.

## Setup

Get your organization and activation key from
https://access.redhat.com/management/activation_keys

Add the desired organization and activation key to the file `.rhsm` [¹][1]
```
ORG=12345
KEY=containers-r-us
```

## Build:
```bash
docker login registry.redhat.io
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
docker build --secret id=rhsm,src=.rhsm --tag jhriv/urban-octo-meme --file Dockerfile-uom .
docker push jhriv/urban-octo-meme:latest
```
### NB:

The `jhriv/urban-octo-meme` repository is private. Use your own private repository.


## Usage:
```bash
docker build --build-arg repository=jhriv/urban-octo-meme --tag urban-octo-meme .
docker-compose up --detach
curl http://localhost:9292/
```
### NB:

The `jhriv/urban-octo-meme` repository is private. Use your own private repository.


<!-- Footnotes -->
[1]: # "There is nothing special about this name, as long as it is consistent with the src specification in the docker build invocation."
