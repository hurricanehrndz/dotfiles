#!/usr/bin/env zsh
# vim:set sw=2 sts=2 ts=2 et:

# wake-on-lan ryzen-server
alias wake-server='sudo wakeonlan -i 10.255.250.255 4c:cc:6a:fc:f0:7f'

# unlock vms
alias unlock-ryzen='until nc -w 3 -z 10.255.250.210 222; do sleep 3; done; pass -c systems/ryzen-vmm01 && xclip -o -selection clipboard | ssh -p 222 root@10.255.250.210 cryptroot-unlock'
alias unlock-dev='until nc -w 3 -z 10.255.250.211 222; do sleep 3; done; pass -c systems/ryzen-dev-vm01 && xclip -o -selection clipboard | ssh -p 222 root@10.255.250.211 cryptroot-unlock'
