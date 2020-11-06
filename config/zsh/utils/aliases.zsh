#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:
# catch-all alias file for various utilities

alias e='exa'
alias el='exa -lh --group-directories-first'
alias ela='exa -lha --group-directories-first'
alias elt='exa -lha --sort modified --group-directories-first'
alias t='exa -T'
alias tl='exa -Tl'

# nvim edit aliases
alias nvea='nvim "$DOTFILES/config/zsh/utils/aliases.zsh"'

# rust tools
alias cat='bat'
