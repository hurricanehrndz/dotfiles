{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Source default nix profile
  targets.genericLinux.enable = true;

  # Configure nix
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [(import ./pkgs/default.nix)];
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs.nix;

  home.packages = with pkgs; [
    # My cmdline utils
    bottom
    exa
    htop
    ripgrep

    # nix stuff
    nix-zsh-completions

    # utils
    weechat

    # my local packages
    sheldon
  ];

  # Enable shell management
  programs.zsh = {
    enable = true;
    enableCompletion = false; # Enable when ready
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    history = {
      extended = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = ".config/zsh/.zsh_history";
    };
    # completion and plugins
    initExtra = ''
      ${builtins.readFile ./zsh/completion-opts.zsh}
    '';
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
