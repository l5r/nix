
{ config, pkgs, ...}: {

  home.packages = with pkgs; [
    aileron
    fira
    fira-code
    fira-code-symbols
    nerdfonts
    corefonts
    noto-fonts
    emojione

    # To input emoji's
    ideogram
  ];

  # programs = {
  #   kitty.font.name = "Fira Code 11";
  # };

}
