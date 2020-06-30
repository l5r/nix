
{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    spotifyd
    spotify
    pavucontrol
    playerctl
  ];

  services.spotifyd = {
    enable = true;
    settings = {
      global =
        (import ./credentials.nix).spotify // {
          backend = "pulseaudio";
          volume_normalization = "true";
        };
    };
  };

}

