FROM markgaze/vscode:nodejs

RUN npm install -g create-react-app

RUN code --install-extension jawandarajbir.react-vscode-extension-pack --user-data-dir /home/user

RUN chown -R user:user $HOME