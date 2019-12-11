IMAGE := sshd
TAG := latest

CONTAINER_NAME := sshd
PORT := 2222

build:
	docker build . -t $(IMAGE):$(TAG)

kill_server:
	docker kill $(CONTAINER_NAME)

start_server:
	@docker run --name=$(CONTAINER_NAME) --rm -p $(PORT):22 $(IMAGE):$(TAG) &
	@echo "docker ssh server started."
	@echo "  Usage: ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null localhost -p $(PORT)"
