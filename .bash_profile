#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

GUIX_PROFILE="$HOME/.guix-profile"
. "$GUIX_PROFILE/etc/profile"

GUIX_PROFILE="/home/rodrigo/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"

