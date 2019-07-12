UID   := $(shell id -u)
GID   := $(shell id -g)

LOCALWORK := $(shell readlink -f localwork)
IMAGE     := u1804
TAG       := $(shell date --iso-8601=d)

IMAGE_TAG := $(IMAGE):$(TAG)

build:
	docker build . -t $(IMAGE_TAG)

run: build
	mkdir -p $(LOCALWORK)
	docker run --rm -it -u $(UID):$(GID) -v $(LOCALWORK):/work $(IMAGE_TAG)
