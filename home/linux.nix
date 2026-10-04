{ pkgs, ... }:
{
  imports = [ ./common.nix ];

  targets.genericLinux.enable = true;

  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo";
  home.stateVersion = "26.05";

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
