{ config, pkgs, ... }:

{
  # Enable zram swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
}
