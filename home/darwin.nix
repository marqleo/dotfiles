{ pkgs, ... }:
{
  imports = [ ./common.nix ];

  home.username = "leonardo";
  home.homeDirectory = "/Users/leonardo";

  home.packages = with pkgs; [
    coreutils
  ];
}
