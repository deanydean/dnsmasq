
IMAGE_NAME ?= deanydean/dnsmasq
IMAGE_TAG ?= latest

.DEFAULT: build
.PHONY: build run

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run: build
	docker run --rm -it \
		-p 53:53/tcp -p 53:53/udp -p 67:67/udp -p 68:68/udp \
		$(IMAGE_NAME):$(IMAGE_TAG)
