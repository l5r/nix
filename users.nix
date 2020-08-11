
{ config, pkgs, ... }:

let
  usernames = [ "leander" ];
in
{

  imports = [
    (import <home-manager/nixos>)
  ];

  users.users.leander = {
    isNormalUser = true;
    shell = "/run/current-system/sw/bin/fish";
    extraGroups = [
      "wheel"
      "input"
      "tty"
      "networkmanager"
      "sway"
      "video"
      "audio"
      "adbusers"
      "vboxusers"
      "libvirtd"
    ];
  };

  home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;

  home-manager.users = builtins.foldl' (a: b: a//b) {}
    (map (name: { "${name}" = import (./users + "/${name}/default.nix"); }) usernames);

}
