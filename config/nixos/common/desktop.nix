{ config, pkgs, ... }:

{
  # X11 things
  imports = [ ./xserver.nix ./sound.nix ./fonts.nix ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
