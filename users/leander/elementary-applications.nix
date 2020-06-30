{ config, pkgs, ...}: {

  home.packages = with pkgs; [

    # system utilities
    gnome3.file-roller
    pantheon.elementary-code
    pantheon.elementary-terminal
    pantheon.pantheon-agent-polkit
    gnome-usage

    # applications
    pantheon.elementary-photos
    pantheon.elementary-videos
    pantheon.elementary-music
    pantheon.elementary-calculator
    pantheon.elementary-calendar
    gnome3.geary

    # configuration
    # pantheon.elementary-settings-daemon
    (pantheon.switchboard-with-plugs.override {
      useDefaultPlugs = true;
      plugs = [
        pantheon.switchboard-plug-bluetooth
        pantheon.switchboard-plug-network
        pantheon.switchboard-plug-onlineaccounts
        pantheon.switchboard-plug-printers
        pantheon.switchboard-plug-sharing
        pantheon.switchboard-plug-sound
        pantheon.switchboard-plug-security-privacy
        glib-networking
      ];
    })

    # cosmetic
    hicolor-icon-theme
    pantheon.elementary-icon-theme
    gnome3.adwaita-icon-theme
    elementary-xfce-icon-theme
    pantheon.extra-elementary-contracts
  ];

  gtk.enable = true;
  gtk.iconTheme = {
    name = "elementary";
  };

  # services.pantheon.apps.enable = true;
  # services.pantheon.contractor.enable = true;
}
