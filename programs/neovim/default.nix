{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Always loaded
      (nvim-treesitter.withPlugins (p: [
        p.haskell
        p.lua
        p.clojure
        p.java
        p.c
        p.nix
      ]))

      # Lazy loaded
      {
        plugin = which-key-nvim;
        optional = true;
      }
      {
        plugin = bufferline-nvim;
        optional = true;
      }
      {
        plugin = indent-blankline-nvim;
        optional = true;
      }
      {
        plugin = fzf-lua;
        optional = true;
      }
      {
        plugin = conform-nvim;
        optional = true;
      }
      {
        plugin = oil-nvim;
        optional = true;
      }
      {
        plugin = mini-nvim;
        optional = true;
      }
      {
        plugin = nvim-paredit;
        optional = true;
      }
    ];

    extraPackages = with pkgs; [
      # Lua
      lua-language-server
      stylua

      # Nix
      nixd
      nixfmt

      # Haskell
      haskell-language-server
      ormolu
    ];

    initLua = ''
      ${builtins.readFile ./init.lua}
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}

      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/lsp.lua}
      ${builtins.readFile ./plugins/which-key.lua}
      ${builtins.readFile ./plugins/ibl.lua}
      ${builtins.readFile ./plugins/bufferline.lua}
      ${builtins.readFile ./plugins/fzf-lua.lua}
      ${builtins.readFile ./plugins/conform.lua}
      ${builtins.readFile ./plugins/oil.lua}
      ${builtins.readFile ./plugins/mini.lua}
      ${builtins.readFile ./plugins/paredit.lua}
    '';
  };
}
