{ pkgs, ... }:
{
  imports = [
    ../programs/neovim
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fzf
    ripgrep
    bat
    eza
    jq
    fd
    gcc
    gnumake
    ghc
    cabal-install
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

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    escapeTime = 0;
    focusEvents = true;
    keyMode = "vi";
    clock24 = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set -as terminal-features ",xterm-256color:RGB"

      set-option -g renumber-windows on

      unbind %
      bind | split-window -h -c "#{pane_current_path}"

      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"

      # Vim-like copy/paste
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi 'C-v' send-keys -X rectangle-toggle

      bind-key -T copy-mode-vi y send-keys -X copy-pipe "pbcopy"
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe "pbcopy"

      # Pane navigation
      bind-key -n 'M-h' select-pane -L
      bind-key -n 'M-j' select-pane -D
      bind-key -n 'M-k' select-pane -U
      bind-key -n 'M-l' select-pane -R
    '';
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
