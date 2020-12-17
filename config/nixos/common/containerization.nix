{ config, pkgs, ... }:

{
  # Enable podman, and lxd
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
    lxd.enable = true;
  };
}

