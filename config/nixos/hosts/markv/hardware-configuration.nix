# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot.initrd.availableKernelModules =
    [ "uhci_hcd" "ehci_pci" "ahci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/36654621-7953-402b-a48a-dc06f1b42455";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/568A-91D4";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/f25d953a-86a1-4f85-a063-316a4481569b";
    fsType = "btrfs";
  };

  fileSystems."/nix/store" = {
    device = "/dev/disk/by-uuid/36654621-7953-402b-a48a-dc06f1b42455";
    fsType = "btrfs";
    options = [ "subvol=@nix-store" ];
  };

  fileSystems."/nix/var" = {
    device = "/dev/disk/by-uuid/36654621-7953-402b-a48a-dc06f1b42455";
    fsType = "btrfs";
    options = [ "subvol=@nix-var" ];
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/36654621-7953-402b-a48a-dc06f1b42455";
    fsType = "btrfs";
    options = [ "subvol=@var" ];
  };

  swapDevices = [ ];

}
