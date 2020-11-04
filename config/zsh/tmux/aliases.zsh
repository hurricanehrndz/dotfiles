#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

TMUX_CONF="~/.config/tmux/tmux.conf"

alias                               \
  tn="tmux -u -f $TMUX_CONF new"    \
  ta="tmux -u -f $TMUX_CONF attach" \
  tm="tmux -u -f $TMUX_CONF"        \
  tt="nvim $TMUX_CONF"

alias tsheldon='sheldon --data-dir "$HOME/.config/tmux/plugins" --config-dir "$HOME/.config/tmux"'
