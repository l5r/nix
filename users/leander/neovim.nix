
{ config, pkgs, ... }@args:
{

  home.packages = [ pkgs.solargraph pkgs.neovim-qt ];

  xdg.configFile."nvim/after/ftplugin/racket.vim".text = ''
    imap <buffer> <C-L> λ
    setlocal foldmarker=(,)
  '';

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPython3Packages = (ps: with ps; [
      ps.pylint
      (ps.jedi.overridePythonAttrs (old: rec {
        version = "0.17.2";
        src = pkgs.python3.pkgs.fetchPypi {
          pname = "jedi";
          inherit version;
          sha256 = "080xyf97ifabdz7jp8clg00b8zv5g33fva1fb2xf80q6fndpvvc6";
        };
        postPatch = ''
          substituteInPlace requirements.txt --replace "parso>=0.7.0,<0.8.0" "parso"
        '';
      }))
    ]);

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
        direnv-vim

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
        coc-metals
      ] ++ (builtins.attrValues (import ./neovim-plugins args));
  };

}
