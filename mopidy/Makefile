IMAGE ?= markgaze/mopidy
TAG ?= latest
CONTAINER ?= mopidy

.PHONY: build
build: 
	docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run: 
	docker run -d \
		--user root \
		--device /dev/snd \
		--device /dev/dri \
		-v /home/markgaze/.config/mopidy/mopidy.conf:/var/lib/mopidy/.config/mopidy/mopidy.conf \
		-v /etc/asound.conf:/etc/asound.conf \
		-p 6601:6600 \
		-p 6680:6680 \
		--user $UID:$GID \
		--group-add "$(getent group audio | cut -d: -f3)" \
		--name $(CONTAINER) $(IMAGE):$(TAG)
		mopidy -o youtube/enabled=false

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