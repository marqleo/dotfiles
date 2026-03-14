{ pkgs, ... }: {
	system.primaryUser = "leonardo";
	ids.gids.nixbld = 350;

	users.users.leonardo = {
		name = "leonardo";
		home = "/Users/leonardo";
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.defaults = {
		dock.autohide = true;
	};

	system.stateVersion = 4;
}
