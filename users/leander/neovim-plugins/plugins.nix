
{ pkgs, ...}:
with pkgs.vimUtils; with pkgs; {


    neoranger = buildVimPluginFrom2Nix {
      name = "neoranger-git-2019-06-11";
      src = fetchTarball {
        url = "https://github.com/Lokaltog/neoranger/archive/5edfbdd5c14d589f4f57ba1dab28a9072107cb83.tar.gz";
        sha256 = "1s4r868w98890d5lp0spf37bfv6sb6z4an3p3q14fwd2sb0ysq8f";
       };
      meta = {
        homepage = https://github.com/Lokaltog/neoranger; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    table-mode = buildVimPluginFrom2Nix {
      name = "table-mode-git-2020-03-02";
      src = fetchTarball {
        url = "https://github.com/dhruvasagar/vim-table-mode/archive/6412352b544bda764a9616c3090abb09729526bc.tar.gz";
        sha256 = "1z5v849vjbk4mdgkxs73b2nnvmqx7l6h3ycdb16qdhp9kppwmbvv";
       };
      meta = {
        homepage = https://github.com/dhruvasagar/vim-table-mode; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    sexp = buildVimPluginFrom2Nix {
      name = "sexp-git-2017-05-15";
      src = fetchTarball {
        url = "https://github.com/guns/vim-sexp/archive/12292941903d9ac8151513189d2007e1ccfc95f0.tar.gz";
        sha256 = "1mfqbmrbqgnsc34pmcsrc0c5zvgxhhnw4hx4g5wbssfk1ddyx6y0";
       };
      meta = {
        homepage = https://github.com/guns/vim-sexp; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    snippets = buildVimPluginFrom2Nix {
      name = "snippets-git-2020-03-19";
      src = fetchTarball {
        url = "https://github.com/honza/vim-snippets/archive/6e6b69fd5c12d4645225e7a3ba7d9f3414d83d25.tar.gz";
        sha256 = "0hc914c74dy22nm9bx2qd37py8f2xf3ylnfr3v4lvbxpnlpahjjc";
       };
      meta = {
        homepage = https://github.com/honza/vim-snippets; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    bundler = buildVimPluginFrom2Nix {
      name = "bundler-git-2019-11-12";
      src = fetchTarball {
        url = "https://github.com/tpope/vim-bundler/archive/0396ce134dd69b022c20b104c450c6121f0cb760.tar.gz";
        sha256 = "0crxib110l3d9vg63glbynxdifrawnsayhvjfqqiaiv31dz78q5h";
       };
      meta = {
        homepage = https://github.com/tpope/vim-bundler; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    rails = buildVimPluginFrom2Nix {
      name = "rails-git-2020-01-17";
      src = fetchTarball {
        url = "https://github.com/tpope/vim-rails/archive/64befc6187678893082bebb8be79c1d17fdd07ba.tar.gz";
        sha256 = "1yjqxqx3g74afzdq8iqd6zw7ypn6dv1i14qi9a7jnnwnp956lc12";
       };
      meta = {
        homepage = https://github.com/tpope/vim-rails; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    sexp-mappings-for-regular-people = buildVimPluginFrom2Nix {
      name = "sexp-mappings-for-regular-people-git-2020-01-16";
      src = fetchTarball {
        url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people/archive/7c3de2f13422fb4b62b4c34a660532c7b3d240c7.tar.gz";
        sha256 = "0malswal9hnbq2wf1rx2lp1r69wpwsvyhgi46xbg079x2n857bmj";
       };
      meta = {
        homepage = https://github.com/tpope/vim-sexp-mappings-for-regular-people; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    pandoc = buildVimPluginFrom2Nix {
      name = "pandoc-git-2020-03-20";
      src = fetchTarball {
        url = "https://github.com/vim-pandoc/vim-pandoc/archive/c473c298d570622d520f455698a95356e55d6dcf.tar.gz";
        sha256 = "1j4plsm7md6yhis8bmgznwln12gnnm0lg9wvxgydqd6wxrc6hfnd";
       };
      meta = {
        homepage = https://github.com/vim-pandoc/vim-pandoc; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    pandoc-syntax = buildVimPluginFrom2Nix {
      name = "pandoc-syntax-git-2020-01-31";
      src = fetchTarball {
        url = "https://github.com/vim-pandoc/vim-pandoc-syntax/archive/0d1129e5cf1b0e3a90e923c3b5f40133bf153f7c.tar.gz";
        sha256 = "162l2p8md8lfyfjxzlmlz5ky5kvvr6wjmdk8r8lk6ygpkl2b51f7";
       };
      meta = {
        homepage = https://github.com/vim-pandoc/vim-pandoc-syntax; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  

    racket = buildVimPluginFrom2Nix {
      name = "racket-git-2020-03-16";
      src = fetchTarball {
        url = "https://github.com/wlangstroth/vim-racket/archive/65e6e61e4492fefdddd992158d784cc751401590.tar.gz";
        sha256 = "1ai5fh6m708grialss5kyy9cxi603zc880mswy9r6f6q58j78idq";
       };
      meta = {
        homepage = https://github.com/wlangstroth/vim-racket; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  
}
