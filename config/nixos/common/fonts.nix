{ config, pkgs, ... }:

{
  # Install some fonts system-wide, especially "Source Code Pro" in the
  # Nerd-Fonts pached version with extra glyphs.
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "Hack" "SourceCodePro" ]; })
      joypixels
      noto-fonts
      noto-fonts-cjk
      liberation_ttf
      noto-fonts-emoji
      corefonts
    ];
  };
}
