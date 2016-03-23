alias b="bundle exec"
alias rr="bundle exec rake"
alias br="bundle exec rails"
alias bo="bundle open"
alias h="history"

if [[ "`uname`" == "Darwin" ]]; then
  alias ll="ls -l -G"
  alias la="ls -laF -G"
else
  alias ll="ls -l --color"
  alias la="ls -laF --color"
fi

function sst() { ssh -t $1 "tmux new -A -s $1" }
function fxp() { git commit --fixup=$1 }
function sq()  { git commit --squash=$1 }
function rbz() { git rebase -i $1 --autosquash }
function upr() { git fetch -p --tags && git checkout $1 && git pull; git checkout "-" }

alias gg="`which grep` --color=auto"
alias gap="git add -p"
alias gc="git commit -m"
alias gf="git fetch -p"
alias zbs="git rebase --continue"

function jar-manifest() { unzip -q -c $1 META-INF/MANIFEST.MF }
function cert-info() { openssl x509 -text -in $1 }

function add-to-htpasswd() {
  local user=$1
  local pass=$(openssl rand -base64 9)
  local hashed=$(openssl passwd -apr1 ${pass})

  printf "${user}:${hashed}\n" >> .htpasswd
  echo "User: ${user}, password: ${pass}"
}

function ersh() {
  if [ -d "./deps" ]; then
    erl -pa ebin -pa deps/*/ebin +pc unicode $@
  else
    erl -pa ebin +pc unicode $@
  fi
}

function to_s() {
  for i in $@; do
    echo -n "$i "
  done
}

function ntf() {
  local argv_str="`to_s $@`"
  $@
  local ec=$?
  local title

  if [ $ec -eq 0 ]; then
    title='✅ Complete'
  else
    title='❌ Failed'
  fi

  osascript -e "display notification \"$argv_str\" with title \"$title\""
}
