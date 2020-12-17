{ config, pkgs, ... }:

{
  # Enable virt-manager, podman, and lxd
  virtualisation = {
    libvirtd = {
      enable = true;
      # Don't start the VMs on host boot
      onBoot = "ignore";
    };
  };
  environment.systemPackages = with pkgs; [ virt-manager ];
  # required by virt-manager
  programs.dconf.enable = mkOptionDefault true;
}
