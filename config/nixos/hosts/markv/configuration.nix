# NixOS first deployment
{ config, pkgs, ... }:

let hostName = "markv";
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Import me!
    ../../profiles/hurricanehrndz.nix
    # home-manager
    <home-manager/nixos>
    # Include reusables
    ../../common/uefi-boot.nix
    ../../common/zswap.nix
    ../../common/base.nix
    ../../common/qemu-guest.nix
    ../../common/firewall.nix
    ../../common/openssh.nix
    ../../common/containerization.nix
    ../../common/desktop.nix
  ];

  # Define the hostname
  networking = {
    inherit hostname;
    networkmanager.enable = true;
  };

  home-manager.users.hurricanehrndz = import ../../../nix/home.nix;

  # Help - Think before changing
  system.stateVersion = "20.09";
}
