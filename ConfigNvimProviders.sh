#!/usr/bin/env bash

echo "Using home: $HOME"

# Install pyenv
if [[ ! -d $HOME/.pyenv ]]; then
  git clone https://github.com/pyenv/pyenv "$HOME/.pyenv"
fi

# Install pyenv-virtualenv
if [[ ! -d $HOME/.pyenv/plugins/pyenv-virtualenv ]]; then
  git clone https://github.com/pyenv/pyenv-virtualenv "$HOME/.pyenv/plugins/pyenv-virtualenv"
fi

# Install update
if [[ ! -d $HOME/.pyenv/plugins/pyenv-update ]]; then
  git clone https://github.com/pyenv/pyenv-update "$HOME/.pyenv/plugins/pyenv-update"
fi

# Install pyenv-doctor
if [[ ! -d $HOME/.pyenv/plugins/pyenv-doctor ]]; then
  git clone https://github.com/pyenv/pyenv-doctor "$HOME/.pyenv/plugins/pyenv-doctor"
fi

# Install pyenv-install-latest
if [[ ! -d $HOME/.pyenv/plugins/pyenv-install-latest ]]; then
  git clone https://github.com/momo-lab/pyenv-install-latest "$HOME/.pyenv/plugins/pyenv-install-latest"
fi

# Install pyenv-virtualenvwrapper
if [[ ! -d $HOME/.pyenv/plugins/pyenv-virtualenvwrapper ]]; then
  git clone https://github.com/pyenv/pyenv-virtualenvwrapper "$HOME/.pyenv/plugins/pyenv-virtualenvwrapper"
fi

# Update path
while IFS= read -r pathname; do
  if [[ $PATH =~ $pathname ]]; then
    PATH="$pathname:$PATH"
  fi
done < <( find $HOME/.pyenv -type d -name versions -prune -o -name bin -print )
PATH="$HOME/.pyenv/shims:$PATH"

echo "Using the following path: $PATH"

# Update pyenv plugins
#pyenv update

# Install python2.7
if [[ $(find $HOME/.pyenv/versions/ -maxdepth 1 -type d -name 2.7* | wc -l) == 0 ]]; then
  pyenv install-latest 2.7
fi

# Install python3.6
if [[ $(find $HOME/.pyenv/versions/ -maxdepth 1 -type d -name 3.6* | wc -l) == 0 ]]; then
  pyenv install-latest 3.6
fi

# Set pyenv default python version
pyv2="$(find $HOME/.pyenv/versions/ -maxdepth 1 -type d -name '2.7*' | tail)"
pyv3="$(find $HOME/.pyenv/versions/ -maxdepth 1 -type d -name '3.6*' | tail)"
pyenv global "${pyv2##*/}" "${pyv3##*/}"

# Init pyenv and virtualenvwrapper
WORKON_HOME="$HOME/.virtualenvs"
pyenv init -
pyenv virtualenv-init -
eval "$(pyenv sh-virtualenvwrapper)"

# Check for neovim2 virtualenv
if [[ ! -d $HOME/.virtualenvs/neovim2 ]]; then
  mkvirtualenv -p python2 neovim2
fi

# Check for neovim3 virtualenv
if [[ ! -d $HOME/.virtualenvs/neovim2 ]]; then
  mkvirtualenv -p python3 neovim3
fi

# Install python support
$HOME/.virtualenvs/neovim2/bin/pip install neovim
$HOME/.virtualenvs/neovim3//bin/pip install flake8 jedi psutil setproctitle
$HOME/.virtualenvs/neovim3/bin/pip install neovim neovim-remote nodeenv

# Install npm support
workon neovim3
if [[ ! -x $HOME/.virtualenvs/neovim3/bin/node ]]; then
  nodeenv -p
fi
npm i -g bash-language-server
npm i -g dockerfile-language-server-nodejs
npm i -g javascript-typescript-langserver
npm i -g neovim
gem_bin=$(find $HOME/.rubies/ -name "gem")

# Install ruby support
$gem_bin install neovim
