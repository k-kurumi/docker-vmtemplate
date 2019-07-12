
IMAGE := sshd
TAG := latest


build:
	docker build . -t $(IMAGE):$(TAG)

run:
	docker run --name=sshd -t -p 2222:22 $(IMAGE):$(TAG)
