
{ config, pkgs, ... }:

let
  usernames = [ "leander" ];
  home-manager = builtins.fetchTarball {
    url = "https://github.com/rycee/home-manager/archive/5969551a5cc52f9470b5ff5ca01327bf4bda82c1.tar.gz";
    sha256 = "0f4kz83a1kp3ci8zi5hvp8fp34wi73arpykl4d9vlywdk6w36bnd";
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
