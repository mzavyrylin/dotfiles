alias b="bundle exec"
alias rr="bundle exec rake"
alias br="bundle exec rails"
alias h="history"

if [[ "`uname`" == "Darwin" ]]; then
  alias ll="ls -l -G"
  alias la="ls -laF -G"
else
  alias ll="ls -l --color"
  alias la="ls -laF --color"
fi

alias gg="`which grep` --color=auto"
alias gap="git add -p"
alias gc="git commit -m"
alias gf="git fetch -p"
alias gum="git fetch -p && git checkout master && git pull && git checkout -"
