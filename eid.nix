{ config, pkgs, ... }: {
  services.pcscd.enable = true;
  services.pcscd.plugins = [ pkgs.ccid ];

  environment.systemPackages = [
    pkgs.eid-mw
  ];
}
