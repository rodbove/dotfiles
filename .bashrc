#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/rodrigo/bin
export KUBE_EDITOR=nvim
export EDITOR=nvim

# import work commands if any
if [ -f ~/.bash_work ]; then
	. ~/.bash_work;
fi

# Replace a few ls commands with exa
alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'
alias l.="exa -a | egrep '^\.'"

# Replace cat for bat
alias cat='bat --style header --style rules --style snip --style changes --style header'

# Useful/Common
alias ..='cd ..'
alias ...='cd ../..'
alias dir='dir --color=auto'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias tmux="tmux -2"
alias xcp="xclip -selection clipboard"

## Custom commands/functions
alias android-studio="~/android-studio/bin/studio.sh"
alias lens="~/Lens/Lens.AppImage"
alias nosql="/opt/nosqlbooster-mongodb/nosqlbooster4mongo"
alias myip="curl ifconfig.me | xclip -selection clipboard"

#Laptop specifics 
alias aa="./Documents/usefulscripts/script/laptopkb/laptopkb-disable.sh"
alias xmonitor="xrandr --current --output HDMI-1 --primary --output eDP-1 --off"

#AWS
alias awsssh="aws ssm start-session --target"
# Git
alias ggpull="git pull origin master"
alias gcm="git checkout master"
alias gs="git stash"
alias gsa="git stash apply"
# Docker
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dps="docker ps"
alias kubekind="kubectl config use-context kind-kind"

# Specific for laptop with "broken" * key that keeps pressing
alias drw="xmodmap -e 'keycode 63='"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
