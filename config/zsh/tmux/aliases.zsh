#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

TMUX_CONF="~/.config/tmux/tmux.conf"

alias                               \
  tn="tmux -u -f $TMUX_CONF new"    \
  ta="tmux -u -f $TMUX_CONF attach" \
  tt="nvim $TMUX_CONF"
