REGISTRY = arvintian
PROJECT = gogarp
GIT_VERSION = $(shell git rev-parse --short HEAD)

build:
	go build -o gogarp main.go

container:
	docker build -t $(REGISTRY)/$(PROJECT):$(GIT_VERSION) .

clean:
	rm -f gogarp