#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

# Shortcut to dotfiles path is $DOTFILES
export DOTFILES="$XDG_CONFIG_HOME/dotfiles"

# Time format
export TIME="\t%e real,\t%U user,\t%S sys"

# Default Programs
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"

# Default editor
if (( $+commands[nvim] )); then
  export VIMCONFIG="$HOME/.config/nvim"
  export VIMDATA="$HOME/.local/share/nvim"
  export EDITOR='nvim'
  export VISUAL="nvim"
else
  export EDITOR='vi'
  export VISUAL="vi"
fi

# Pagers
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -RF"

# xmonad dirs
export XMONAD_CONFIG_DIR="$XDG_CONFIG_HOME/xmonad"
export XMONAD_CACHE_DIR="$XDG_CACHE_HOME/xmonad"
export XMONAD_DATA_DIR="$XDG_DATA_HOME/xmonad"

# kvm default connection
export VIRSH_DEFAULT_CONNECT_URI='qemu:///system'

# tmux config
export TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux.conf"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# autosuggetions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# ANSIBLE cfg
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"

# GOLANG
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$HOME/.local/bin"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# FNM
export FNM_DIR="$XDG_DATA_HOME/fnm"

path=(               \
  "$CARGO_HOME/bin"  \
  "$HOME/.local/bin" \
  "$HOME/.yarn/bin"  \
  "$path[@]"         \
)
export PATH
