FROM markgaze/vscode

RUN apt-get update && apt-get -y install golang && \
  code --install-extension ms-vscode.go --user-data-dir /home/user

RUN go get github.com/mdempsky/gocode && \
  go get github.com/uudashr/gopkgs/cmd/gopkgs && \
  go get github.com/ramya-rao-a/go-outline && \
  go get github.com/acroca/go-symbols && \
  go get golang.org/x/tools/cmd/guru && \
  go get golang.org/x/tools/cmd/gorename && \
  go get github.com/derekparker/delve/cmd/dlv && \
  go get github.com/rogpeppe/godef && \
  go get golang.org/x/tools/cmd/godoc && \
  go get github.com/sqs/goreturns && \
  go get github.com/golang/lint/golint

RUN chown -R user:user $HOME