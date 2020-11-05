#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

if (( ! $+commands[nvim] )); then
  return
fi

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

alias vi='nvim'
alias vim='vim'
alias vimdiff='nvim -d'
alias nveplg='nvim ~/.config/nvim/lua/plugs.lua'
alias nvelsp='nvim ~/.config/nvim/lua/lsp_config.lua'

if [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
  if (( $+commands[nvr] )); then
    export EDITOR='nvr'
    alias nvim=nvr
    alias vi=nvr
  else
    alias vi='echo "No nesting!"'
    alias nvim='echo "No nesting!"'
  fi
fi
