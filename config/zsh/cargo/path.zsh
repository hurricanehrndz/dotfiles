#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

test -d "$HOME/.cargo/bin" || return 0

path=("$HOME/.cargo/bin" $path)
