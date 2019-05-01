#!/usr/bin/env bash

echo "Using home: $HOME"

echo "Removing existing python install and virtualenvs..."
rm -rf "$HOME/.virtualenvs/neovim2" "$HOME/.virtualenvs/neovim3" "$HOME/.virtualenvs/ansible-dev"
rm -rf "$HOME/.pyenv/versions"
rm -rf "$HOME/.nvm"
rm -rf "$HOME/.yarn/bin"
rm -rf "$HOME/.config/yarn"

# Install node support
NVM_DIR="$HOME/.nvm"
if [[ ! -e $NVM_DIR ]]; then
  git clone https://github.com/creationix/nvm "$NVM_DIR"
fi
. $NVM_DIR/nvm.sh
nvm install node
npm i -g yarn
yarn global add prettier
yarn global add bash-language-server
yarn global add dockerfile-language-server-nodejs
yarn global add javascript-typescript-langserver
yarn global add neovim

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

OTHER_PATHS=("$HOME/.cargo/bin" "$HOME/.pyenv/shims" "$HOME/.pyenv/bin" "$HOME/.local/bin" "/snap/bin")
for other_path in "${OTHER_PATHS[@]}"; do
  if [[ ! "$PATH" =~ $other_path  ]]; then
    PATH="$other_path:$PATH"
  fi
done
export PATH

echo "Using the following path: $PATH"

# Update pyenv plugins
export PYENV_ROOT="$HOME/.pyenv"
pyenv update

# Install python3.7
if ! pyenv versions | grep -q -c "3.7" ; then
  pyenv install-latest 3.7
fi

# Set pyenv default python version
pyv3="$(find "$HOME/.pyenv/versions/" -maxdepth 1 -type d -name '3.7*' | tail)"
pyenv global "${pyv3##*/}"
pyenv rehash

# Install Ansible
pip3 install -U pip
pip3 install -U setuptools
pip3 install -U wheel
pip3 install -U virtualenvwrapper


# Init pyenv and virtualenvwrapper
# shellcheck disable=SC2034
WORKON_HOME="$HOME/.virtualenvs"
PYENV_SHELL=bash
PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV=true
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper

# Check for neovim3 virtualenv
if [[ ! -d $HOME/.virtualenvs/neovim3 ]]; then
  mkvirtualenv neovim3
fi

# Install python3 support
workon neovim3
pip3 install -U pip
pip3 install -U setuptools
pip3 install -U wheel
pip3 install -U virtualenvwrapper
pip install flake8 jedi psutil setproctitle
pip install python-language-server yamllint
pip install pynvim neovim-remote

# setup Ansible-dev env
if [[ ! -d $HOME/.virtualenvs/ansible-dev ]]; then
  mkvirtualenv ansible-dev
fi
workon ansible-dev
pip3 install -U pip
pip3 install -U setuptools
pip3 install -U wheel
pip3 install -U virtualenvwrapper
if ! pip show ansible > /dev/null 2>&1 ; then
  pip install ansible
  pip install ansible-lint
  pip install molecule
  pip install docker
  pip install Sphinx
fi

if ! pip show ansible-toolbox > /dev/null 2>&1 ; then
  pip install git+https://github.com/larsks/ansible-toolbox
fi

if ! pip show python-distutils-extra 2>&1 ; then
  pip install git+https://salsa.debian.org/debian/python-distutils-extra.git@2.42
fi

if ! pip show python-apt > /dev/null 2>&1 ; then
  pip install git+https://salsa.debian.org/apt-team/python-apt@1.8.4
fi

# Install ruby support
gem_bin=$(find "$HOME/.rubies/" -name "gem")
$gem_bin install neovim

function linkToPath() {
  #function_body
  local bin_path="${1}"
  local destination="$HOME/.local/bin/"
  local bin_name
  bin_name="$(basename "$bin_path")"
  if [[ -e "$bin_path"  ]]; then
    ln -sf "$(readlink -nf "$bin_path")" "${destination}${bin_name}"
  fi
}

# Setup superseding binaries
binaries=("$HOME/.virtualenvs/neovim3/bin/nvr" \
  "$HOME/.virtualenvs/neovim3/bin/yamllint" \
  "$HOME/.virtualenvs/neovim3/bin/flake8" \
  "$HOME/.virtualenvs/neovim3/bin/pyls" )

mkdir -p "$HOME/.local/bin"
for bin in "${binaries[@]}"; do
  linkToPath "$bin"
done

# Install rls
if [[ -z "$(command -v rustup)"  ]]; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
fi
rustup component add rls-preview rust-analysis rust-src
cargo install --force ripgrep
mkdir -p "$HOME/.zfunc"
rustup completions zsh > "$HOME/.zfunc/_rustup"
