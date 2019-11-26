#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:


export VIRTUAL_ENV_DISABLE_PROMPT=12

[[ -s "${HOME}/.local/share/pyenv/bin/pyenv" ]] || return

export PYENV_ROOT="$HOME/.local/share/pyenv"
path=("$PYENV_ROOT/bin" $path)

eval "$(command pyenv init - --no-rehash zsh)"

