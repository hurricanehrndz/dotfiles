# vim:set ft=sh sw=2 sts=2 ts=2 et:
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

if [[ ! -z  "$(command -v chruby)" ]]; then
  chruby ruby
fi

# set cursor, to pipe
if [[ -o interactive ]] && [[ -t 2 ]]; then
  print -n -- "\033[1 q"
fi

# make sure vi opens vim
alias vi='nvim'
alias vim='vim'

# Create a rm alias, default alias too intrusive
alias rm='nocorrect rm'
alias rm="${aliases[rm]:-rm} -I"

# screen lock
alias afk='i3exit lock'

# diff
alias cdiff='command diff'

# firewalld alias
alias fwc='_ firewall-cmd'

# enable color
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# commonly used sudo programs
alias lsblk='sudo lsblk'
alias virsh='virsh -c qemu:///system'
alias virt-viewer='virt-viewer -c qemu:///system'
alias virt-install='sudo virt-install -c qemu:///system'

# password store
alias pwork="PASSWORD_STORE_DIR=$HOME/.work-pass-store pass"
alias ppers="PASSWORD_STORE_DIR=$HOME/.personal-pass-store pass"

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a | grep Exited |  docker ps -a | grep Exited | grep -oe "^\w*")'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# 10 second wait if you do something that will delete everything. I wish I'd had this before...
setopt RM_STAR_WAIT

# Enable color support for various tty utils
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors ~/.dir_colors)"
fi

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# todo
alias t='todo.sh'
alias m='buku'

# load custom functions
fpath=(~/.zfunc /etc/zsh_completion.d $fpath)
autoload -Uz alarm calc btheadphones

# wake-on-lan cal-fedora-vmm01
alias wake-server='sudo ether-wake -i wlp58s0 4c:cc:6a:fc:f0:7f'

# bundle exec
alias be='TERM=xterm-color bundle exec'

# kitchen
alias kitchen='TERM=xterm-color kitchen'
alias kc='TERM=xterm-color kitchen'

# ssh
alias ssh='TERM=xterm-color ssh'

# unlock server
alias unlock-ryzen='ppers -c systems/cal-fedora-vmm01 && xclip -o -selection clipboard | ssh -p 222 root@cal-fedora-vmm01 unlock'
alias unlock-dev='ppers -c systems/cal-fedora-dev01 && xclip -o -selection clipboard | ssh -p 222 root@cal-fedora-dev01 unlock'
