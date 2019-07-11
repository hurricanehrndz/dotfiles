#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

test -d "$HOME/.local/share/fzf/bin" || return 0

path=("$HOME/.local/share/fzf/bin" $path)
