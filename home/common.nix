{ pkgs, config, ... }:
{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    tmux
    fzf
    ripgrep
    bat
    jq
    fd
    gcc
    gnumake
    haskellPackages.cabal-fmt
    haskellPackages.fourmolu
    nixfmt
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Leonardo Marques";
        email = "marqleo@protonmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "eastwood";
    };
  };

  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua".source = ./nvim/lua;
  xdg.configFile."nvim/lazy-lock.json".source =
    config.lib.file.mkOutOfStoreSymlink "/Users/leonardo/dotfiles-nix/home/nvim/lazy-lock.json";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    escapeTime = 0;
    focusEvents = true;
    keyMode = "vi";
    clock24 = true;
    terminal = "tmux-256color";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    package = if pkgs.stdenv.isDarwin then null else pkgs.ghostty;
    settings = {
      theme = "Carbonfox";
      font-size = 14;
      macos-option-as-alt = true;
      window-padding-x = 10;
      window-padding-y = 10;
    };
  };
}
