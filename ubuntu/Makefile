UID   := $(shell id -u)
USER  := $(shell id -u -n)
GID   := $(shell id -g)
GROUP := $(shell id -g -n)

LOCALWORK := $(shell readlink -f localwork)
IMAGE     := u1804
TAG       := $(shell date --iso-8601=d)

IMAGE_TAG := $(IMAGE):$(TAG)

docker_build:
	docker build . -t $(IMAGE_TAG) --build-arg uid=$(UID) --build-arg gid=$(GID) --build-arg user=$(USER) --build-arg group=$(GROUP)

docker_run:
	mkdir -p $(LOCALWORK)
	docker run -it --entrypoint=/bin/bash -v $(LOCALWORK):/home/$(USER)/work $(IMAGE_TAG)
