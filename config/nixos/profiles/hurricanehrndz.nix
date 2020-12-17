{ config, pkgs, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    # Shell is set to zsh for all users as default.
    defaultUserShell = pkgs.zsh;

    users.hurricanehrndz = {
      isNormalUser = true;
      home = "/home/hurricanenhrndz";
      description = "Carlos Benito Hernandez";
      extraGroups = [ "wheel" "networkmanager" "audio" "libvirtd" "lxd" ];
      shell = pkgs.zsh;

      # Public ssh-keys that are authorized for the user. Fetched from homepage
      # and github profile.
      openssh.authorizedKeys.keyFiles = [
        (builtins.fetchurl { url = "https://github.com/hurricanehrndz.keys"; })
      ];
    };
  };

  # Allow to run nix
  nix.allowedUsers = [ "hurricanehrndz" ];
  # Allow container access
  virtualisation.containers.users = [ "hurricanehrndz" ];
}
