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
    nil
    statix
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

  programs.nvf = {
    enable = true;
    settings = {
      vim.lazy.enable = true;
      vim.opts = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        smartindent = true;
      };
      vim.lsp = {
        enable = true;
        formatOnSave = true;
        null-ls.enable = true;
      };
      vim.languages = {
        nix = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          format.type = "nixfmt";
        };
      };
      vim.binds = {
        whichKey = {
          enable = true;
          setupOpts.preset = "helix";
        };
      };
      vim.fzf-lua.enable = true;
      vim.keymaps = [
        {
          key = "<leader><leader>";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua files<CR>";
          desc = "Find files (fzf-lua)";
        }
        {
          key = "<leader>q";
          mode = "n";
          silent = true;
          action = "<cmd>qa<CR>";
          desc = "Quit All";
        }
        {
          key = "<leader>/";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua live_grep<CR>";
          desc = "Grep (fzf-lua)";
        }
        {
          key = "<leader>,";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua buffers<CR>";
          desc = "List buffers (fzf-lua)";
        }
        {
          key = "<leader>bd";
          mode = "n";
          silent = true;
          action = "<cmd>bd<CR>";
          desc = "Delete buffer";
        }
        {
          key = "H";
          mode = "n";
          silent = true;
          action = "<cmd>bp<CR>";
          desc = "Previous buffer";
        }
        {
          key = "L";
          mode = "n";
          silent = true;
          action = "<cmd>bn<CR>";
          desc = "Next buffer";
        }
        {
          key = "<C-h>";
          mode = "n";
          action = "<C-w>h";
          desc = "Move to left window";
        }
        {
          key = "<C-j>";
          mode = "n";
          action = "<C-w>j";
          desc = "Move to bottom window";
        }
        {
          key = "<C-k>";
          mode = "n";
          action = "<C-w>k";
          desc = "Move to top window";
        }
        {
          key = "<C-l>";
          mode = "n";
          action = "<C-w>l";
          desc = "Move to right window";
        }
        {
          key = "<leader>wqq";
          mode = "n";
          action = "<cmd>wq<CR>";
          desc = "Quit window";
        }
        {
          key = "<leader>wqa";
          mode = "n";
          action = "<cmd>wq<CR>";
          desc = "Quit All window";
        }
        {
          key = "<leader>|";
          mode = "n";
          action = "<cmd>vsplit<CR>";
          desc = "Split window vertically";
        }
        {
          key = "<leader>-";
          mode = "n";
          action = "<cmd>split<CR>";
          desc = "Split window horizontally";
        }
      ];
    };
  };
}
