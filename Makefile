.PHONY: build
build:
	cd vscode && make build
	cd vscode/dotnetcore && make build
	cd vscode/go && make build
	cd vscode/go-lambda && make build
	cd vscode/nodejs && make build
	cd vscode/react && make build
	cd vscode/angular && make build

.PHONY: push
push:
	cd vscode && make push
	cd vscode/dotnetcore && make push
	cd vscode/go && make push
	cd vscode/go-lambda && make push
	cd vscode/nodejs && make push
	cd vscode/react && make push
	cd vscode/angular && make push