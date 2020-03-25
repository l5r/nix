
{ config, pkgs, ... }:

let
  usernames = [ "leander" ];
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "0d1ca254d0f213a118459c5be8ae465018132f74";
    ref = "release-19.09";
  };
in
{

  imports = [
    (import "${home-manager}/nixos")
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
    ];
  };

  home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;

  home-manager.users = builtins.foldl' (a: b: a//b) {}
    (map (name: { "${name}" = import (./users + "/${name}/default.nix"); }) usernames);

}
