#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

FNM_DIR="${HOME}/.local/share/fnm"

path=(               \
  "$GOPATH/bin"      \
  "$HOME/.cargo/bin" \
  "$HOME/.local/bin" \
  "$HOME/.yarn/bin"  \
  $path              \
)
