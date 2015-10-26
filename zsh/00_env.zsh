export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export RUBY_CFLAGS="-march=native -O2"
export ARCHFLAGS="-arch x86_64"
export PATH="$HOME/.rbenv/bin:$HOME/.erlenv/bin:/usr/local/bin:$PATH:$HOME/bin"
export TERM=xterm-256color
export EDITOR=vim

if [ `uname` = "Darwin" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

#export DOCKER_HOST=tcp://localhost:2375
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

eval "$(rbenv init -)"
eval "$(erlenv init -)"
