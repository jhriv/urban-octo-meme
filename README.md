Urban Octo Meme
===

A test example of using the Red Hat Universal Base Image as a basis for
containerized apps.

Setup
---

Create a file named `.rhsm`[¹][1] that contains your RHEL Developer credentials in
`<username>:<password>` format[²][2].

Example:
A user named `johnny` with a password of `appleseed` would have
```
johnny:appleseed
```

Build:
---
### NB:

The `jhriv/urban-octo-meme` is a private repository. Use your own private repository.

```bash
docker login registry.redhat.io
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
docker build --secret id=rhsm,src=.rhsm --tag jhriv/urban-octo-meme --file Dockerfile-uom .
docker push jhriv/urban-octo-meme:latest
```

Usage:
---
### NB:

The `jhriv/urban-octo-meme` is a private repository. Use your own private repository.

```bash
docker build --build-arg repository=jhriv/urban-octo-meme --tag urban-octo-meme .
docker-compose up --detach
curl http://localhost:9292/
```

BUGS:
---

If your password or username has a colon in it, please fix [subscribe.sh][S] and make a pull request.

<!-- References -->
[S]: https://github.com/jhriv/urban-octo-meme/blob/main/subscribe.sh

<!-- Footnotes -->
[1]: # "There is nothing special about this name, as long as it is consistent with the src specification in the docker build invocation."
[2]: # "This very bad practice. Until Docker lets us have an interactive means to pass secrets, this will have to do. My pull request DMs are open."
