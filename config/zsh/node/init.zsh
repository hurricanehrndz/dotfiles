#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

if (( $+commands[fnm] )); then
  eval $(fnm env --shell=zsh --multi --fnm-dir=$FNM_DIR)
  [[ -e "$FNM_DIR/aliases/default" ]] && fnm use --quiet default
fi
