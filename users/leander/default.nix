
{ config, pkgs, ...}:

{
  imports = [
    ./neovim.nix
    ./devel.nix
    ./fish.nix
    ./fonts.nix
    ./kitty.nix
    ./mail.nix
    ./music.nix
    ./elementary-applications.nix
    ./gdrive.nix
    ./remarkable.nix
  ];

  home.packages = with pkgs; [

    # cli tools
    ripgrep-all
    htop
    wtf
    neofetch
    xdg_utils
    xorg.xhost

    (pkgs.callPackage (import ./lock.nix) {})

    # applications
    inkscape
    gimp
    libreoffice-fresh
    languagetool
    eid-mw
    commonsCompress
    unzip
    p7zip
    xarchiver
    transmission-gtk
    gparted
    gptfdisk
    gnome3.gnome-disk-utility
    kdeconnect
    feedreader
    teams

    google-drive-ocamlfuse
    pdfarranger

    # games
    steam
    steam-run
    multimc
    discord
  ];

  nixpkgs.config.allowUnfree = true;

  # xdg.enable = true;
}

