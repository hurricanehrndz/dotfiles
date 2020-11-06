#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

if [[ -d "$HOME/go" ]]; then
  export GOPATH=$HOME/go
  path=("$GOPATH/bin" $path)
fi

if [[ -d "$HOME/.cargo/bin"  ]]; then
  path=("$HOME/.cargo/bin" $path)
fi
