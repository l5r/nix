# This file contains the base setup for sway

{ config, pkgs, lib, ... }: 
let
  startsway = (pkgs.writeTextFile {
    name = "startsway";
    destination = "/bin/startsway";
    executable = true;
    text = ''#! ${pkgs.bash}/bin/bash

      # first import environment variables from the login manager
      systemctl --user import-environment
      # then start the service
      exec systemctl --user start sway.service
    '';
  });
in
{

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = "https://github.com/colemickens/nixpkgs-wayland/archive/d3ecfac3b3533c02e7ac7e9afdf0acc7a3c25026.tar.gz";
  #     sha256 = "1267jpx1n1gf3g2m405qacqldza4jzqa46zkdjg64racgchfbnay";
  #   }))
  # ];

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock-fancy # lockscreen
      swayidle
      xwayland # for legacy apps
      waybar # status bar
      mako # notification daemon
      kanshi # autorandr
      wofi
      wl-clipboard
      # wlogout
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };

  # environment = {
  #   etc = {
  #     # Put config files in /etc. Note that you also can put these in ~/.config, but then you can't manage them with NixOS anymore!
  #     "sway/config".source = ./dotfiles/sway/config;
  #     "xdg/waybar/config".source = ./dotfiles/waybar/config;
  #     "xdg/waybar/style.css".source = ./dotfiles/waybar/style.css;
  #   };
  # };

  # Here we but a shell script into path, which lets us start sway.service (after importing the environment of the login shell).
  environment.systemPackages = with pkgs; [
    startsway
  ];

  systemd.user.targets.sway-session = {
    description = "Sway compositor session";
    documentation = [ "man:systemd.special(7)" ];
    # bindsTo = [ "graphical-session.target" ];
    # wants = [ "graphical-session-pre.target" ];
    # after = [ "graphical-session-pre.target" ];
  };

  systemd.user.services.sway = {
    description = "Sway - Wayland window manager";
    documentation = [ "man:sway(5)" ];
    # bindsTo = [ "graphical-session.target" ];
    # wants = [ "graphical-session-pre.target" ];
    # after = [ "graphical-session-pre.target" ];
    # We explicitly unset PATH here, as we want it to be set by
    # systemctl --user import-environment in startsway
    environment.PATH = lib.mkForce null;
    serviceConfig = {
      Type = "simple";
      ExecStart = ''
        ${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway
      '';
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  services.redshift = {
    enable = true;
    # Redshift with wayland support isn't present in nixos-19.09 atm. You have to cherry-pick the commit from https://github.com/NixOS/nixpkgs/pull/68285 to do that.
    package = pkgs.redshift-wlr;
  };
  location.provider = "geoclue2";
  services.geoclue2 = {
    enable = true;
  };

  programs.waybar.enable = true;

  systemd.user.services.kanshi = {
    description = "Kanshi output autoconfig ";
    wantedBy = [ "sway.service" ];
    partOf = [ "sway-session.target" ];
    serviceConfig = {
      # kanshi doesn't have an option to specifiy config file yet, so it looks
      # at .config/kanshi/config
      ExecStart = ''
        ${pkgs.kanshi}/bin/kanshi
      '';
      RestartSec = 5;
      Restart = "always";
    };
  };
}

