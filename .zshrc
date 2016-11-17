export ZSH=$HOME/.dotfiles
fpath=($HOME/.dotfiles/zsh-completions/src $fpath)

if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

typeset -U config_files
config_files=($ZSH/**/*.zsh)

# load paths
for file in ${(M)config_files:#*/path.zsh}; do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source $file
done

setopt prompt_subst
PROMPT='%T%b %{[00;34m%}%~%{[00m%}`git-prompt`%(!.#.>) '

autoload -U compinit
compinit

unset config_files
