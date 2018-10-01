IMAGE ?= markgaze/sqlserver
TAG ?= 2017
CONTAINER ?= sqlserver

.PHONY: build
build: 
	docker build -t $(IMAGE):$(TAG) .

.PHONY: run
run: 
	docker run -d -v ~/databases:/home/user/databases -e SA_PASSWORD=${SA_PASSWORD} -e ACCEPT_EULA=yes --name $(CONTAINER) $(IMAGE):$(TAG)

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