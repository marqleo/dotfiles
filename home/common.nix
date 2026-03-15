{ pkgs, config, ... }: {
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
	};

	xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
	xdg.configFile."nvim/lua".source = ./nvim/lua;
	xdg.configFile."nvim/lazy-lock.json".source = 
    config.lib.file.mkOutOfStoreSymlink "/Users/leonardo/dotfiles-nix/home/nvim/lazy-lock.json";

	home.sessionVariables = {
		EDITOR = "nvim";
	};
}
