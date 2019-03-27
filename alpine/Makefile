.PHONY: build run

UID := $(shell id -u)
GID := $(shell id -g)
UNAME := $(shell id -u -n)
GNAME := $(shell id -u -n)
MOUNT_PATH := $(shell readlink -f localwork)

build:
	@mkdir -p localwork
	docker build . -t a1 --build-arg uid=$(UID) --build-arg gid=$(GID) --build-arg user=$(UNAME) --build-arg group=$(GNAME)

run:
	@mkdir -p localwork
	docker run -it --entrypoint=/bin/bash -v $(MOUNT_PATH):/work a1
