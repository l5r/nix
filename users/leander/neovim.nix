
{ config, pkgs, ... }@args:
{

  xdg.configFile."nvim/after/ftplugin/racket.vim".text = ''
    imap <buffer> <C-L> λ
  '';

  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraConfig = ''
      set clipboard=unnamedplus
      source ${./config/nvim/keybinds.vim}
    '';

    plugins = with pkgs.vimPlugins; [
        editorconfig-vim
        fzf-vim
        neovim-sensible
        vim-obsession
        vim-airline
        vim-fugitive
        vim-surround
        vim-tmux-navigator

        vim-plug

        vim-polyglot
        coc-nvim
        coc-snippets
        coc-solargraph
        coc-yaml
        coc-css
        coc-python
        coc-rls
        coc-tsserver
        coc-vetur
        coc-git
        coc-lists
        coc-highlight
        # coc-metals
      ] ++ (with (import ./neovim-plugins args); [
        neoranger
      ]);
  };

}
