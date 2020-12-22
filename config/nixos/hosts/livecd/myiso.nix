{ config, pkgs, ... }:

{
  # See: https://nixos.wiki/wiki/Creating_a_NixOS_live_CD
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>

    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  users.users.nixos.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/QDa0fOiCcKHs+Ke0u44KAT1kLAjqO4r8MDxtsdWkG+GHhwxsGFKGB2kEhSzmoiMHTVgfLscifCx9z12yRdmmTIkrwRkuOZOx8wlqnVBckq7ZvZBFcA9KK+lG0CcLbwNKCqYBJIgUGLTmpJuyX4OKJlS7tIPCibHaswaiN6Hu6NWl4Rp/3FjjmQkG2alivjtWLh3Lr3c5Gzgw1T8v2yMB7piIxy0a5u4Pp28kkILQ1VABqTUJ50Uzx5Jfi4+oVCBEIliK/60wVqRT6rDSr3/x9QskiDRpJvgDldiwUGJBuVahuc6qW2QzKMAkk/gtJYpURhDNwAie6Fjd7HR2AhZPrBmILFNYclWk1E3MvhWgZ0iaW5W++XqH33pH/xpT9rgvH7yPuSz5tbLWZN0KMHeaGvzzGZzhdrvHBcYK/55p/n+W8jBjRXnZ6bPqyCy1TPOkv4LdYOAQuL5nnGOIWD1UE+mZfelOXl1pLgQ0tG99Un6BjqIdew2dOvp7eKBDDDeWg6aU9Ct8GQygHaRkkAPe6AabBmIltjVooTBXcNhiAuvTA3ZT67BiHufsnsJ9T7OjSnH4cVP4g4SVZQZnuDsOkC7Aao/z0v/V+BT7xe2IEHwZdc8fcuC36yz5u4PgyNdRtinUHiKG5VBK8BZAiCG0JA0CVX6ZDygRDf9Kofx cardno:000604154446"
  ];
}
