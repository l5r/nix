
{ config, pkgs, ... }:

{
  imports =
    [ ./sway-base.nix
    ];

  programs = {
    evince.enable = true;
    nm-applet.enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox-devedition-bin
    kitty
    lxtask
    pavucontrol
    sbc
    pantheon.elementary-files
    pantheon.elementary-icon-theme
    pantheon.elementary-gtk-theme
    pantheon.pantheon-agent-polkit
    glib
    gvfs
    nfs-utils
    sshfs
  ];

  programs.dconf.enable = true;
  services.gnome3 = {
    gnome-keyring.enable = true;
    gnome-online-accounts.enable = true;
  };
  services.gvfs.enable = true;
  services.pantheon.contractor.enable = true;
  services.gsignond = {
    enable = true;
    plugins = with pkgs; [
      gsignondPlugins.mail
      gsignondPlugins.oauth
    ];
  };

  services.pipewire.enable = true;

  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluezFull;

    config."General"."Enable" = "Source,Sink,Media,Socket";
  };

  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };
}

