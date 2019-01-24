FROM debian:buster

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

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
  libcanberra-gtk-module \
  --no-install-recommends

RUN apt-get update && apt-get install -y wget alsa-utils pulseaudio

RUN wget https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.22/franz_5.0.0-beta.22_amd64.deb && \
  apt install ./franz_5.0.0-beta.22_amd64.deb -y

RUN sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/daemon.conf && \
  sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user

RUN chown -R user:user $HOME

RUN usermod -a -G audio user

COPY start.sh /usr/local/bin/start.sh

ENV HOME /home/user

WORKDIR $HOME

CMD [ "start.sh" ]
