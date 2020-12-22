{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.sheldon;

  configFile = config:
    pkgs.runCommand "plugins.toml" {
      buildInputs = [ pkgs.remarshal ];
      preferLocalBuild = true;
      allowSubstitutes = false;
    } ''
      remarshal -if json -of toml \
        < ${pkgs.writeText "plugins.json" (builtins.toJSON config)} \
        > $out
    '';

in {
