# -*- mode: sh -*-

# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.7z)       7z x $1                             ;;
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *.xz)       xz -dk $1                           ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
function title() {
    # escape '%' chars in $1, make nonprintables visible
    a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
        screen)
            print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
            ;;
        xterm*|rxvt)
            print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
            ;;
    esac
}

function ssr() { local session=`echo "$1" | tr '.-' '_'`; ssh -t $1 "tmux attach-session -t $session || tmux new -A -s $session" }
function fxp() { git commit --fixup=$1 }
function sq()  { git commit --squash=$1 }
function rbz() { git rebase -i $1 --autosquash }
function upr() { git fetch -p --tags && git checkout $1 && git pull; git checkout "-" }

function jar-manifest() { unzip -q -c $1 META-INF/MANIFEST.MF }
function cert-info() { openssl x509 -text -in $1 }

function add-to-htpasswd() {
  local user=$1
  local pass=$(openssl rand -base64 9 | tr '/+=' 'sPe') # letters and digits only
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
