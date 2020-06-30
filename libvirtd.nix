{ config, pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  # needed for nixops
  networking.firewall.checkReversePath = false;
  environment.systemPackages = [ pkgs.virt-manager ];
}
