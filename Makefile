
IMAGE_NAME ?= deanydean/dnsmasq
IMAGE_TAG ?= latest

.DEFAULT: build
.PHONY: build run

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run: build
	docker run --rm -it \
		--cap-add CAP_NET_ADMIN --cap-add CAP_NET_RAW \
		-p 15353:53/tcp -p 15353:53/udp -p 16767:67/udp -p 16868:68/udp \
		$(IMAGE_NAME):$(IMAGE_TAG)
