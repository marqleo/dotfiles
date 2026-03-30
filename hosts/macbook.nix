{ pkgs, ... }:
{
  system.primaryUser = "leonardo";
  ids.gids.nixbld = 350;

  users.users.leonardo = {
    name = "leonardo";
    home = "/Users/leonardo";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 2;
      Minute = 0;
    };
    options = "--delete-older-than 7d";
  };

  system.defaults = {
    dock.autohide = true;
  };

  system.stateVersion = 4;
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "ghostty"
    ];
  };
}
