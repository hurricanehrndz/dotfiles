#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

TMUX_CONF="~/.config/tmux/tmux.conf"

alias                               \
  tn="tmux new"    \
  ta="tmux attach" \
  tm="tmux"        \
  tt="nvim $TMUX_CONF"

alias tsheldon='sheldon --data-dir "$HOME/.config/tmux/plugins" --config-dir "$HOME/.config/tmux"'
