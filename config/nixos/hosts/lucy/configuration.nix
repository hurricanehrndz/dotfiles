# NixOS first deployment
{ config, pkgs, ... }:

let
  hostName = "lucy";
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "63f299b3347aea183fc5088e4d6c4a193b334a41";
    ref = "release-20.09";
  };
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Import me!
    ../../profiles/hurricanehrndz.nix
    # home-manager
    (import "${home-manager}/nixos")
    # Include reusables
    ../../common/uefi-boot.nix
    ../../common/zswap.nix
    ../../common/base.nix
    ../../common/firewall.nix
    ../../common/openssh.nix
    ../../common/containerization.nix
  ];

  # Define the hostname
  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  home-manager.users.hurricanehrndz = import ../../../nix/home.nix;

  # Help - Think before changing
  system.stateVersion = "20.09";
}
