{ pkgs, ... }:
{
  imports = [
    ../programs/neovim
  ];

  home.stateVersion = "26.05";

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
    hyperfine
    haskellPackages.ghc-prof-flamegraph
    firefox

    # LaTeX and ABNT requirements
    texliveFull
    zathura
    python3Packages.pygments
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

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g __fish_git_prompt_show_informative_status 1
      set -g __fish_git_prompt_hide_untrackedfiles 1
      set -g __fish_git_prompt_color_branch magenta bold
      set -g __fish_git_prompt_showupstream informative
      set -g __fish_git_prompt_color_dirtystate blue
      set -g __fish_git_prompt_color_stagedstate yellow
      set -g __fish_git_prompt_color_invalidstate red
      set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
      set -g __fish_git_prompt_color_cleanstate green bold
    '';
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

      # Status
      set-option -g status-position top
      set-option -g status-justify absolute-centre
    '';
  };

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    package = if pkgs.stdenv.isDarwin then null else pkgs.ghostty;
    settings = {
      theme = "Carbonfox";
      font-size = 13;
      macos-option-as-alt = true;
      window-padding-x = 10;
      window-padding-y = 10;
    };
  };
}
