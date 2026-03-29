{ pkgs, ... }:
let
  pluginFiles = builtins.readDir ./plugins;
  toConfigFile = file: _: {
    name = "nvim/lua/plugins/${file}";
    value = {
      source = ./plugins + "/${file}";
    };
  };
in
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

    initLua = builtins.readFile ./init.lua;
  };

  xdg.configFile = {
    "nvim/lua/options.lua".source = ./options.lua;
    "nvim/lua/keymaps.lua".source = ./keymaps.lua;
    "nvim/lua/plugins".source = ./plugins;
  };
}
