#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

FNM_DIR="${HOME}/.local/share/fnm"

test -d "$FNM_DIR" || return 0

path=("$FNM_DIR" $path)

YARN_BIN_PATH="${HOME}/.yarn/bin"

test -d "$YARN_BIN_PATH" || return 0

path=("$YARN_BIN_PATH" $path)
