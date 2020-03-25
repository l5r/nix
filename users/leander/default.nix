
{ config, pkgs, ...}:

{
  imports = [
    ./neovim.nix
    ./devel.nix
    ./fish.nix
    ./fonts.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [

    # cli tools
    ripgrep-all
    htop
    wtf
    neofetch

    # applications
    inkscape
    spotifyd
    spotify
    kupfer
    pavucontrol

    # games
    steam
    multimc
    discord

  ];

  nixpkgs.config.allowUnfree = true;

  # services.spotify = {
  #   enable = true;
  #   settings = {
  #     global =
  #       (import ./credentials.nix).spotify // {
  #         backend = "pulseaudio";
  #         volume_normalization = true;
  #       };
  #   };
  # };

  # Needed for pulseaudio
  xsession.enable = true;
  xsession.windowManager.command = "sway";

  # xdg.enable = true;
  gtk.enable = true;
}

