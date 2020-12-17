{ config, pkgs, ... }:

{
  # Allow proprietary packages
  nixpkgs.config.allowUnfree = true;

  # Set localization and tty options
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set the timezone
  time.timeZone = "America/Edmonton";

  documentation.enable = true;
  documentation.man.enable = true;
  documentation.dev.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
    };
    enableCompletion = true;
    autosuggestions.enable = true;
  };

  # System-wide environment variables to be set
  environment = {
    variables = {
      # There is no other editor
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  # Needed for zsh completion of system packages, e.g. systemd
  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    # Version control / archiving
    gitAndTools.gitFull
    gnupg
    unzip
    zip

    # Text Editor
    neovim

    # Linux shell utils
    dnsutils
    dosfstools
    exfat
    file
    gawk
    htop
    inxi
    lsof
    psmisc
    ripgrep
    tmux
    which

    # nix tools
    nox
    nix-du

    # Hardware-related tools
    usbutils
    pciutils
    lshw
  ];

  services.haveged.enable = true;
  services.lorri.enable = true;

  #nix.trustedUsers = [ "@wheel" ];

  # Clean up old generations after 30 days
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
