{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Enable XDG User Directories
  xdg.enable = true;
  # Configure nix
  nixpkgs.config.allowUnfree = true;
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs.nix;

  home.packages = with pkgs; [
    # Basic tools
    htop
    ripgrep
  ];

  home.sessionVariables = { EDITOR = "nvim"; };
}
