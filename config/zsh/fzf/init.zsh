#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

(( $+commands[fzf] )) || return

if [[ -s "$HOME/.local/share/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOME/.local/share/fzf/shell/key-bindings.zsh"
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

fman() {
  man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}
