FROM debian:buster
LABEL maintainer "Mark Gaze <mark.l.gaze@gmail.com>"

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	--no-install-recommends

# Add the vscode debian repo
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add -
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get update && apt-get -y install \
	code \
	git \
	make \
	wget \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libexpat1 \
	libfontconfig1 \
	libfreetype6 \
	libgtk2.0-0 \
	libpango-1.0-0 \
	libx11-xcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	openssh-client \
	--no-install-recommends

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user
RUN mkdir -p ~/.local/share/fonts && \
	for type in Bold Light Medium Regular Retina; do wget -O ~/.local/share/fonts/FiraCode-$type.ttf "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-$type.ttf?raw=true"; done && \
	fc-cache -f

RUN code --install-extension pkief.material-icon-theme --user-data-dir /home/user && \
	code --install-extension streetsidesoftware.code-spell-checker --user-data-dir /home/user && \
	code --install-extension eamodio.gitlens --user-data-dir /home/user && \
	code --install-extension esbenp.prettier-vscode --user-data-dir /home/user

COPY ./config/settings.json $HOME/.config/Code/User/settings.json
RUN chown -R user:user $HOME
COPY start.sh /usr/local/bin/start.sh

WORKDIR $HOME

CMD [ "start.sh" ]
