#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi
