#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

TMUX_CONF="~/.config/tmux/tmux.conf"

alias                                      \
  tmn="tmux -u -f $TMUX_CONF new"          \
  tma="tmux -u -f $TMUX_CONF attach"       \
  tml="tmux -u -f $TMUX_CONF ls"           \
  tmk="tmux -u -f $TMUX_CONF kill-session" \
  tm="tmux -u -f $TMUX_CONF"               \
  tmt="nvim $TMUX_CONF"

alias tsheldon='sheldon --data-dir "$HOME/.config/tmux/plugins" --config-dir "$HOME/.config/tmux"'
