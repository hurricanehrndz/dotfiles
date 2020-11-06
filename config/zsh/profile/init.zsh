#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

# application rcs
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -RF"

# kvm default connection
export VIRSH_DEFAULT_CONNECT_URI='qemu:///system'

# nvim settings
if (( $+commands[nvim] )); then
  export VIMCONFIG=~/.config/nvim
  export VIMDATA=~/.local/share/nvim
fi

# tmux config
export TMUX_CONF="~/.config/tmux/tmux.conf"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# autosuggetions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# init zoxide
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi
