#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

# wake-on-lan ryzen-server
alias wake-server='sudo wakeonlan -i 172.28.251.255 4c:cc:6a:fc:f0:7f'

# unlock vms
alias unlock-ryzen='until nc -w 3 -z ryzen-vmm01-boot 222; do sleep 3; done; gopass -c systems/ryzen-vmm01 && pbpaste | ssh -p 222 root@ryzen-vmm01-boot cryptroot-unlock'
