{ config, pkgs, ... }:

{
  imports = [
    ./apps/zsh.nix
    ./apps/neovim.nix
  ];
  home.username = "ring";
  home.homeDirectory = "/home/ring";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [ 
    htop
	lf
	libsForQt5.okular
	pulsemixer
	pamixer
	flameshot
	dunst
	unclutter
	xsel
	xclip

	unzip
	lua
	pandoc
	ffmpeg
	gnumake
	cmake
	gcc
	pkg-config
	freetype
	rustup
  ];
}

