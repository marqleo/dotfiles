{ pkgs, lib, ... }:
{
  imports = [ ./common.nix ];

  targets.genericLinux.enable = true;

  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo";
  home.stateVersion = "26.05";

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Workaround for KDE Plasma KRunner refusing to launch non-executable .desktop files from home directory.
  # KRunner requires .desktop files in user directories to have +x permissions, which Nix store files lack.
  home.activation.copyKdeDesktopFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.local/share/applications
    
    # Clean up old copies
    rm -f $HOME/.local/share/applications/*-nix-copy.desktop
    
    if [ -d "$HOME/.nix-profile/share/applications" ]; then
      for f in "$HOME/.nix-profile/share/applications/"*.desktop; do
        if [ -f "$f" ]; then
          base=$(basename "$f" .desktop)
          dest="$HOME/.local/share/applications/$base-nix-copy.desktop"
          cp "$f" "$dest"
          chmod +x "$dest"
        fi
      done
    fi
  '';
}
