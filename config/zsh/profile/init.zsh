#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

# application rcs
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -RF"
