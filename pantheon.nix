
{ config, pkgs, ...}: {

  environment.systemPackages = with pkgs; [
  ];

  services.xserver = {
    enable = true;
    desktopManager.pantheon.enable = true;
    displayManager.lightdm = {
      enable = true;
      greeters.pantheon.enable = true;
    };
  };
}

