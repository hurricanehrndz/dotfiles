#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:
#
if (( ! $+commands[git] )); then
  return
fi

#_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d %C(reset)%C(blue)Sig:%G?%C(reset)%n'

alias g='git'
alias gcl='git clone --recursive'
alias gf='git fetch'
alias gco='git checkout'
alias gcm='git checkout master'
alias gst='git status'
alias gss='git status --short'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias ggrh='git reset --hard origin/$(current_branch)'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit --verbose'
alias gcs='git commit -S --verbose'
alias gca='git commit -a --verbose'
alias ga='git add'
alias gca!='git commit -a --amend'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gsoc='git rebase --exec "git commit --amend --no-edit -n -S" -i'
