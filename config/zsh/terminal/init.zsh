#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[00;37m'      # Begins underline.
export GROFF_NO_SGR=1                    # for konsole and gnome-terminal


if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if (( $+commands[most] )); then
    export PAGER="most"
else
    export PAGER="less"
fi
