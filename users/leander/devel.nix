
{ config, pkgs, ...}: {
  programs.direnv.enable = true;
  services.lorri.enable = true;

  home.packages = with pkgs; [
    direnv lorri

    # Ruby on rails
    # bundix
    # rubyPackages_2_6.rails
  ];

  programs.git = {
    enable = true;
    ignores = [
      "Session.vim"
    ];
    userEmail = "36822732+l5r@users.noreply.github.com";
    userName = "Leander Lismond";
  };
}
