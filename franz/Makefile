IMAGE ?= markgaze/franz
TAG ?= latest
CONTAINER ?= franz

.PHONY: build
build: 
	docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run: 
	docker run -d \
	 -v /etc/localtime:/etc/localtime:ro \
	 -v /tmp/.X11-unix:/tmp/.X11-unix \
	 -v /run/user/1000/pulse/native:/run/user/1000/pulse/native \
	 -v ~/.config/Franz:/home/user/.config/Franz \
	 -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
	 -e "DISPLAY=unix${DISPLAY}" \
	 -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
	 --shm-size 4g \
	 --device /dev/dri \
	 --device /dev/snd \
	 --group-add $$(getent group audio | cut -d: -f3) \
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