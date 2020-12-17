{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    autorun = false;
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

    # Disable desktop manager.
    desktopManager = {
      xterm.enable = false;
      session =
        [{ name = "home-manager";
           start = ''
             ${pkgs.runtimeShell} $HOME/.hm-xsession &
             waitPID=$!
           '';
         }
        ];
    };
    displayManager.startx.enable = true;

  };

  environment.systemPackages = with pkgs; [ xorg.xkill ];
}
