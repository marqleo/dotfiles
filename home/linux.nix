{ pkgs, ... }:
{
  imports = [ ./common.nix ];

  # linux-specific overrides here

  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo";
  home.stateVersion = "26.05";
}
