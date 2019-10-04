#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:


# virtualenvwrapper
if [[ -s "/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh" ]]; then
  export WORKON_HOME="$HOME/.virtualenvs"
  # pure magic number
  export VIRTUAL_ENV_DISABLE_PROMPT=12
  source "/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh"
fi

[[ -s "${HOME}/.local/share/pyenv/bin/pyenv" ]] || return

export PYENV_ROOT="$HOME/.local/share/pyenv"
path=("$PYENV_ROOT/bin" $path)

# lazy load pyenv
__pyenv_started=0

__pyenv_init() {
  test $__pyenv_started = 0 && {
    eval "$(command pyenv init - --no-rehash zsh)"
    __pyenv_started=1
  }
}

pyenv() {
  __pyenv_init
  command pyenv "$@"
}
