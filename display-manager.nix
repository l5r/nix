{ config, pkgs, ...}:
let cfg = config.services.xserver;
in {
  imports = [];
  systemd.defaultUnit = "graphical.target";
  boot.plymouth.enable = true;

  services.xserver = {

    enable = true;

    desktopManager.pantheon.enable = true;

    displayManager = {
      session = [
        {
          manage = "window";
          name = "sway";
          start = ''
            exec systemctl --user start sway.service
            waitPID=$(systemctl show --user sway | grep ExecMainPID | cut -d = -f 2)
          '';
        }
      ];
      lightdm.enable = true;
      lightdm.greeters.pantheon.enable = true;
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}

