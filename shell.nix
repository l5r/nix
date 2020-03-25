
{ config, pkgs, ... }:

{
  programs = {
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget git
    neovim tmux
    usbutils pciutils
    killall

    ripgrep exa fzf ranger

    # Vim plugins
  ] ++ (with pkgs.vimPlugins; [


    coc-nvim
    coc-highlight
    coc-rls
    coc-solargraph
    coc-yank

    editorconfig-vim
  ]);
}
