{ pkgs, ... }:
{
  imports = [ ./common.nix ];

  targets.genericLinux.enable = true;

  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo";
  home.stateVersion = "26.05";
}
