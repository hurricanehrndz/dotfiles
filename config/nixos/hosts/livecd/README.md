# Creating NixOS headless media

## Install nix

```sh
sudo install -d -m755 -o $(id -u) -g $(id -g) /nix
curl -L https://nixos.org/nix/install | sh
source 
```

## Add stable channel

```sh
nix-channel --add https://nixos.org/channels/nixos-20.09
nix-channel --update nixos-20.09
nix-channel --remove nixpkgs
nix-channel --add https://nixos.org/channels/nixos-20.09 nixpkgs
nix-channel --update nixpkgs
```

## Build ISO

```sh
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=myiso.nix
```

## Cleanup

Need to figure out how to clean the store. I think the `nix-collect-garbage`
could be helpful.

```sh
nix-channel --update
nix-env -u --always
rm /nix/var/nix/gcroots/auto/*
nix-collect-garbage -d
```

Seems like nix-build generates indirect roots -- needs to be researched.

see: https://nixos.org/guides/nix-pills/garbage-collector.html
