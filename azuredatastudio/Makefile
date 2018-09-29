IMAGE ?= markgaze/azuredatastudio
TAG ?= latest
CONTAINER ?= azuredatastudio

.PHONY: build
build: 
	sudo docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run: 
	sudo docker run -it -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=unix${DISPLAY}" --device /dev/dri --name $(CONTAINER) $(IMAGE):$(TAG)

.PHONY: stop
stop: 
	sudo docker stop $(CONTAINER)

.PHONY: remove
remove: 
	sudo docker rm $(CONTAINER)

.PHONY: force-remove
force-remove: 
	sudo docker rm -f $(CONTAINER)

.PHONY: push
push:
	sudo docker push $(IMAGE):$(TAG)