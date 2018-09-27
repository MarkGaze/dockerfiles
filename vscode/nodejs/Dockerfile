FROM markgaze/vscode

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y nodejs && \
  code --install-extension waderyan.nodejs-extension-pack --user-data-dir /home/user

RUN chown -R user:user $HOME