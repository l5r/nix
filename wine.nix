{ config, pkgs, ...}: {
  environment.systemPackages = [
    pkgs.playonlinux
    pkgs.winePackages.stable
  ];

  hardware.opengl.driSupport32Bit = true;
}
