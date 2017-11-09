#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Use gpg-agent for ssh auth
: ${XDG_RUNTIME_DIR:=/run/user/$UID}

if [[ -S "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh" ]] && \
  [[ -S "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent" ]]; then
  unset SSH_AUTH_SOCK

  GPG_AGENT_PID=$(fuser $XDG_RUNTIME_DIR/S.gpg-agent 2>/dev/null)
  GPG_AGENT_INFO=$XDG_RUNTIME_DIR/S.gpg-agent:${GPG_AGENT_PID%% }
  SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"

  # export appropriate variables
  export GPG_AGNET_INFO
  export SSH_AUTH_SOCK
fi

# fix docker bug
unset TERMINFO
