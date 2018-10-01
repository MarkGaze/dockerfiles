IMAGE ?= markgaze/azuredatastudio
TAG ?= latest
CONTAINER ?= azuredatastudio

.PHONY: build
build: 
	docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run: 
	docker run -d -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=unix${DISPLAY}" --device /dev/dri --name $(CONTAINER) $(IMAGE):$(TAG)

.PHONY: stop
stop: 
	docker stop $(CONTAINER)

.PHONY: remove
remove: 
	docker rm $(CONTAINER)

.PHONY: force-remove
force-remove: 
	docker rm -f $(CONTAINER)

.PHONY: push
push:
	docker push $(IMAGE):$(TAG)