#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
export GOPATH=$HOME/go/bin/
export GOMODCACHE=$HOME/go/pkg/mod/
export KUBE_EDITOR=nvim
export EDITOR=nvim

# import company specific commands if any
if [ -f ~/.bash_krz ]; then
	. ~/.bash_krz;
fi

if [ -f ~/.bash_abi ]; then
	. ~/.bash_abi;
fi

# Functions
# Define a function to start tmux sessions with specific directories for certain names
start_ts() {
  for session_name in "$@"; do
    # Check if the session already exists
    tmux has-session -t "$session_name" 2>/dev/null

    if [ $? != 0 ]; then
      # The session does not exist, decide the working directory based on session name
      case "$session_name" in
        abi)
          working_dir="~/ABI"
          ;;
        krz)
          working_dir="~/Kruzer"
          ;;
        *)
          working_dir="~" # Default directory
          ;;
      esac

      # Create the session detached in the specified working directory
      tmux new-session -s "$session_name" -d -c "$working_dir"

      # If it's the first session, attach to it
      if [ "$session_name" == "$1" ]; then
        tmux attach-session -t "$session_name"
      fi
    else
      echo "Session $session_name already exists."
    fi
  done
}


# Replace a few ls commands with exa
alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'
alias l.="exa -a | egrep '^\.'"

# Replace cat for bat
alias cat='bat --style header --style snip --style changes --style header'

# Useful/Common
alias ..='cd ..'
alias ...='cd ../..'
alias dir='dir --color=auto'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias tmux="tmux -2"
alias xcp="xclip -selection clipboard"
alias src="source ~/.bashrc"

## Custom commands/functions
alias android-studio="~/android-studio/bin/studio.sh"
alias lens="~/Lens/Lens.AppImage"
alias nosql="/opt/nosqlbooster-mongodb/nosqlbooster4mongo"
alias myip="curl ifconfig.me | xclip -selection clipboard"

#Laptop specifics 
alias aa="./Documents/usefulscripts/script/laptopkb/laptopkb-disable.sh"
alias xmonitor="xrandr --current --output HDMI-1 --primary --output eDP-1 --off"

# Bluetooth utils
alias btch="bluetoothctl connect 88:C9:E8:2C:37:4C" # Bluetooth connect to Sony Headset

#AWS
alias awsssh="aws ssm start-session --target"

# Git
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gp="git pull "
alias gs="git stash"
alias gsa="git stash apply"

# Docker
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dps="docker ps"
alias dl="docker logs $1 -f -t"
alias drm="docker rm -f"
alias deb="docker exec -it $1 bash"
alias kubekind="kubectl config use-context kind-kind"
# Terraform
alias tf="terraform"
alias tfv="terraform validate"
alias tfp="terraform plan -out tfplan"
alias tfa="terraform apply tfplan"

# Specific for laptop with "broken" * key that keeps pressing
alias asdf="setxkbmap -option caps:super; setxkbmap us -variant workman-intl"
alias asdfj="setxkbmap -option caps:super; setxkbmap us -variant workman-intl; ./.screenlayout/default-kruzer.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
# source <(ng completion script)

# Source config
alias sourceb="source $HOME/.bashrc"
. "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
