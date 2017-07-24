# -*- mode: sh -*-

alias b="bundle exec"
alias rr="bundle exec rake"
alias br="bundle exec rails"
alias bo="bundle open"
alias h="history"

if [[ "`uname`" == "Darwin" ]]; then
  alias ll="ls -lA -G"
else
  alias ll="ls -lA --color"
fi

alias gg="`which grep` --color=auto"
alias gap="git add -p"
alias gc="git commit -m"
alias gf="git fetch -p"
alias zbs="git rebase --continue"
alias gw="./gradlew"
