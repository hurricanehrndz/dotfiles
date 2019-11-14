#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

FNM_DIR="${HOME}/.local/share/fnm"

if (( $+commands[fnm] )); then
  eval $(fnm env --shell=zsh --multi --fnm-dir=$FNM_DIR)
fi

if [[ -e "$FNM_DIR/aliases/default" ]]; then
  fnm use --quiet default
fi
