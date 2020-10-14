HOST_UID   := $(shell id -u)
HOST_GID   := $(shell id -g)
IMAGE_NAME := ubuntu2004:latest

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.DEFAULT_GOAL := help
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: __build_ubuntu2004
__build_ubuntu2004:
	docker build -t $(IMAGE_NAME) ubuntu2004

.PHONY: ubuntu2004
ubuntu2004: __build_ubuntu2004 ## ubuntu20.04コンテナを起動する
	docker run --rm -it -u $(HOST_UID):$(HOST_GID) -v $(PWD):/work/docker-vmtemplate $(IMAGE_NAME)
