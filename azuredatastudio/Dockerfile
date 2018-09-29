FROM debian:buster
LABEL maintainer "Mark Gaze <mark.l.gaze@gmail.com>"

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/Microsoft/azuredatastudio/releases/download/1.0.0/azuredatastudio-linux-1.0.0.deb

RUN apt-get update && apt-get install -y libnotify4 \
  libnss3 \
  gnupg \
  libxkbfile1 \
  libgconf-2-4 \
  libsecret-1-0 \
  libgtk-3-0 \
  libunwind8 \
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

RUN dpkg -i azuredatastudio-linux-1.0.0.deb

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user

RUN mkdir -p ~/.local/share/fonts && \
  for type in Bold Light Medium Regular Retina; do wget -O ~/.local/share/fonts/FiraCode-$type.ttf "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-$type.ttf?raw=true"; done && \
  fc-cache -f

COPY ./settings.json $HOME/.config/azuredatastudio/User/settings.json

RUN chown -R user:user $HOME

COPY start.sh /usr/local/bin/start.sh

ENV HOME /home/user

WORKDIR $HOME

CMD [ "start.sh" ]