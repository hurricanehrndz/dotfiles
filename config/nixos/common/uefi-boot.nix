{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;

    # Cleanup /tmp on reboot
    cleanTmpDir = true;
  };
}
