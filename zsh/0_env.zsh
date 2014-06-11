export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export RUBY_CFLAGS="-march=native -O2"
export ARCHFLAGS="-arch x86_64"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH:$HOME/bin"
export TERM=xterm-256color
export EDITOR=vim

export DOCKER_HOST=tcp://localhost:4243

eval "$(rbenv init -)"
