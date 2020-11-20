#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:
# catch-all alias file for various utilities

# # exa aliases
alias                                                      \
  e='exa'                                                  \
  el='exa -lh --group-directories-first'                   \
  ela='exa -lha --group-directories-first'                 \
  elt='exa -lha --sort modified --group-directories-first'

# replace tree with exa
tl() {
  exa --color=always -Tl $1 | less -R
}
t() {
  exa --color=always -T $1 | less -R
}

# why use vim
alias            \
  vi='nvim'      \
  vd='nvim -d'

# forgot what file I want
alias                                                                       \
  vff='nvim                                                                 \
      $(fzf                                                                 \
        --height 40% --reverse                                              \
        --preview "bat --style=numbers --color=always --line-range :500 {}" \
      )'

# quick edits
alias                                                    \
  vplg='nvim ~/.config/nvim/lua/plugs.lua'               \
  vlsp='nvim ~/.config/nvim/lua/lsp_config.lua'          \
  vaka='nvim "$DOTFILES/config/zsh/profile/aliases.zsh"'

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

# incase I forget to call bat
alias cat='bat'

# tmux
alias                                      \
  tmn="tmux -u -f $TMUX_CONF new"          \
  tma="tmux -u -f $TMUX_CONF attach"       \
  tml="tmux -u -f $TMUX_CONF ls"           \
  tmk="tmux -u -f $TMUX_CONF kill-session" \
  tm="tmux -u -f $TMUX_CONF"               \
  tmc="nvim $TMUX_CONF"

alias tsheldon='sheldon --data-dir "$HOME/.config/tmux/plugins" --config-dir "$HOME/.config/tmux"'

# wake-on-lan ryzen-server
alias wake-server='sudo wakeonlan -i 172.28.251.255 4c:cc:6a:fc:f0:7f'

# unlock vms
alias unlock-ryzen='                                   \
  until nc -w 3 -z ryzen-vmm01-boot 222; do            \
    sleep 3;                                           \
  done;                                                \
  gopass -c systems/ryzen-vmm01 && pbpaste             \
  | ssh -p 222 root@ryzen-vmm01-boot cryptroot-unlock'

# list path
lpath() { echo $PATH | tr ':' '\n' }

# workaround for fnm
alias fnm='fnm --log-level=info'

alias                                                          \
  mlcv='molecule --debug converge'                             \
  mlls='molecule list'                                         \
  mlds='molecule destroy'                                      \
  mlvf='molecule verify'                                       \
  mllt='molecule lint'                                         \
  mllg='molecule login'                                        \
  mlaa='export MLDISTRO="archlinux" MLIMG="archlinux/current"' \
  mlaf='export MLDISTRO="fedora" MLIMG="fedora/33"'            \
  mlau='export MLDISTRO="ubuntu" MLIMG="ubuntu/focal"'
