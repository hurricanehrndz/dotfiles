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
  export VIMCONFIG="$HOME/.config/nvim"
  export VIMDATA="$HOME/.local/share/nvim"
fi

# tmux config
export TMUX_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# autosuggetions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# ANSIBLE cfg
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"

# FNM
export FNM_DIR="$HOME/.local/share/fnm"
if (( $+commands[fnm] )); then
  eval "$(fnm --log-level='quiet' env)"
  [[ -e "$FNM_DIR/aliases/default" ]] && fnm use default
fi

# GOLANG
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
