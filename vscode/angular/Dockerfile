FROM markgaze/vscode:nodejs

RUN npm install -g @angular/cli && \
  code --install-extension johnpapa.angular-essentials --user-data-dir /home/user

RUN chown -R user:user $HOME