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


(( $#commands[(i)lesspipe(|.sh)] )) && eval "$(lesspipe)"
export PAGER="less"
