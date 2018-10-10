IMAGE ?= markgaze/chrome
TAG ?= latest
CONTAINER ?= chrome

.PHONY: build
build: 
	docker build -t $(IMAGE):$(TAG) .

.PHONY: prereqs
prereqs:
	wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
	xhost +"local:docker@"

.PHONY: run
run: 
	@echo "NOTE: If this complains about the seccomp not existing then run 'make prereqs'" 
	docker run -it \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /run/user/1000/pulse/native:/run/user/1000/pulse/native \
		-v ~/Downloads:/home/chrome/Downloads \
		-v ~/.config/google-chrome/:/data \
		-v /dev/shm:/dev/shm \
		-e "DISPLAY=unix${DISPLAY}" \
		-e PULSE_SERVER=unix:/run/user/1000/pulse/native \
		--net host \
		--cpuset-cpus 0 \
		--memory 1gb \
		--shm-size 4g \
		--security-opt seccomp=${HOME}/chrome.json \
		--device /dev/snd \
		--device /dev/dri \
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