
{ config, pkgs, ...}:
{
  home.packages = with pkgs; [ 
    wl-clipboard
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins [
      sidebar
      pain-control
      prefix-highlight
      fpp
      copycat
      yank
      urlview
      vim-tmux-navigator
      {
        plugin = continuum;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }
    ];
  };

}
