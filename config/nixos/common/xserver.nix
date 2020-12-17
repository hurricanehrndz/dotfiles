{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";

    libinput = {
      enable = true;
      accelProfile = "flat";
    };

    config = ''
      Section "InputClass"
        Identifier "mouse accel"
        Driver "libinput"
        MatchIsPointer "on"
        Option "AccelProfile" "flat"
        Option "AccelSpeed" "0"
      EndSection
    '';

    desktopManager = {
      default = "none";
      xterm.enable = false;
      none.enable = true;
    };

    displayManager = {
      lightdm.enable = false;
      startx.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [ xorg.xkill ];
}
