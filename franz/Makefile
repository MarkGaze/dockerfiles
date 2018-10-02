IMAGE ?= markgaze/franz
TAG ?= latest
CONTAINER ?= franz

.PHONY: build
build: 
	docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run: 
	docker run -it \
	 -v /etc/localtime:/etc/localtime:ro \
	 -v /tmp/.X11-unix:/tmp/.X11-unix \
	 -v ~/.config/Franz:/home/user/.config/Franz \
	 -e "DISPLAY=unix${DISPLAY}" \
	 --shm-size 4g \
	 --device /dev/dri \
	 --device /dev/snd \
	 --name $(CONTAINER) $(IMAGE):$(TAG)

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