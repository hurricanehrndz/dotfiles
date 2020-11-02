#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

if (( $+commands[fnm] )); then
  eval $(fnm env --shell=zsh)
  [[ -e "$FNM_DIR/aliases/default" ]] && fnm use default
fi
