#!/usr/bin/env zsh
# vim:set ft=zsh sw=2 sts=2 ts=2 et:

# No duplicates in path arrays
typeset -gU cdpath fpath mailpath PATH path

# all of our zsh files
typeset -U config_files
config_files=($ZDOTDIR/*/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}; do
  source "$file"
done

# load init files
for file in ${(M)config_files:#*/init.zsh}; do
  source "$file"
done

# load sheldon plugins
source <(sheldon source)

# set default node version
if (( $+commands[fnm] )); then
  eval "$(fnm env)"
  [[ -e "$FNM_DIR/aliases/default" ]] && fnm --log-level quiet use default
fi

# load everything but the path and init files
for file in ${${config_files:#*/path.zsh}:#*/init.zsh}; do
  source "$file"
done

unset config_files

_screenfetch=($XDG_DATA_HOME/.screenfetch(Nmh-20))
if [[ $#_screenfetch < 1 ]] && [[ -x $(command -v screenfetch) ]]; then
  touch "$XDG_DATA_HOME/.screenfetch"
  screenfetch
fi

# Update environment before execute
function import_tmux_env() {
  if [[ -n "$TMUX" ]]; then
    ssh_auth_sock=$(tmux show-environment | grep "^SSH_AUTH_SOCK")
    [[ -n "$ssh_auth_sock" ]] && export $ssh_auth_sock
    display=$(tmux show-environment | grep  "^DISPLAY")
    [[ -n "$display" ]] && export $display
  fi
}
preexec_functions+=(import_tmux_env)

# Do not set SSH_AUTH_SOCKET on remote connection
if [[ -z "$SSH_CONNECTION" ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
fi

eval "$(starship init zsh)"

# start tmux on remote session
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  tma -t ssh_tmux || tmn -s ssh_tmux
fi
