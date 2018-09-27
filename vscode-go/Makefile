IMAGE ?= markgaze\vscode-go
CONTAINER ?= vscode-go

.PHONY: build
build: 
	sudo docker build -t $(IMAGE) .

.PHONY: run
run: 
	sudo docker run -d -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/git:/home/user/git -e "DISPLAY=unix${DISPLAY}" --device /dev/dri --name $(CONTAINER) $(IMAGE)

.PHONY: stop
stop: 
	sudo docker stop $(CONTAINER)

.PHONY: remove
remove: 
	sudo docker rm $(CONTAINER)

.PHONY: force-remove
force-remove: 
	sudo docker rm -f $(CONTAINER)