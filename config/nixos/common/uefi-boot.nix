{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Cleanup /tmp on reboot
    cleanTmpDir = true;
  };
}
