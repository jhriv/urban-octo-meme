Urban Octo Meme
===

A test example of using the Red Hat Universal Base Image as a basis for
containerized apps.


```bash
docker login registry.redhat.io
docker build --tag urban-octo-meme "github.com/jhriv/urban-octo-meme#main"
docker run --detach --publish 9292:9292 urban-octo-meme
curl http://localhost:9292/
```
