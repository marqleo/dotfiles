{ pkgs, ... }: {
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

	xdg.configFile."nvim".source = ./nvim;

	home.sessionVariables = {
		EDITOR = "nvim";
	};
}
