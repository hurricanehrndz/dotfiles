{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configure nix
  nixpkgs.config.allowUnfree = true;
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs.nix;

  home.packages = with pkgs; [
    # My cmdline utils
    bottom
    exa
    htop
    ripgrep

    # nix stuff
    nix-zsh-completions
  ];

  # Enable shell management
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = ".config/zsh/.zsh_history";
    };
  };
  programs.bat.enable = true;
  programs.skim = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      directory = {
        truncate_to_repo = false;
        fish_style_pwd_dir_length = 1;
      };
      cmd_duration.disabled = true;
    };
  };

  # Enable XDG User Directories
  xdg.enable = true;

  # Session variables
  home.sessionVariables = { EDITOR = "nvim"; };
}
