{ pkgs, conf, ... }:
{
  services.zerotierone = {
    enable = true;
    joinNetworks = (import ./credentials.nix).zerotier-networks;
    port = 9993;
  };
}
