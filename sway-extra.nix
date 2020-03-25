
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
  ];

  services.gvfs.enable = true;

  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluezFull;

    extraConfig = "
      [General]
      Enable=Source,Sink,Media,Socket
    ";
  };

  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
    support32Bit = true;

    # configFile = pkgs.writeText "default.pa" ''
    #   load-module module-bluetooth-policy
    #   load-module module-bluetooth-discover
    #   load-module module-bluez5-device
    #   load-module module-bluez5-discover
    #   load-module module-dbus-protocol
    # '';
  };
}

