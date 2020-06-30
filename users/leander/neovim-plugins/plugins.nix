
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
      name = "table-mode-git-2020-05-06";
      src = fetchTarball {
        url = "https://github.com/dhruvasagar/vim-table-mode/archive/640400908075c50704e127448175d3ede6bba2e9.tar.gz";
        sha256 = "0gbj324wwgai1kprn78srq3cvldpi6hx9gsr5kk2sn2yxq32xp3y";
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
      name = "snippets-git-2020-06-28";
      src = fetchTarball {
        url = "https://github.com/honza/vim-snippets/archive/3f805a0101e5fdfea4eab992af5aa50e8a242459.tar.gz";
        sha256 = "0ybysjzxpka7lkqd9fjj1nk8byr8g96a3ykmcq0m6xwwyv8732x5";
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
      name = "rails-git-2020-06-19";
      src = fetchTarball {
        url = "https://github.com/tpope/vim-rails/archive/187742a3c18d93e6968f024d7db0f4fc5548408e.tar.gz";
        sha256 = "132rvyn5pwg5xkm6q64k33vm6q9hfpng0wq25387l8l8a7hvj3az";
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
      name = "pandoc-git-2020-05-15";
      src = fetchTarball {
        url = "https://github.com/vim-pandoc/vim-pandoc/archive/e49f9e7e3fc041dab0e9a1de4b564b3ddd8f77aa.tar.gz";
        sha256 = "0i1zcnsc962bzm3q6kw8bldd9xh6vb7kw0j72c4dzwdw4ayx0wf1";
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
      name = "racket-git-2020-06-23";
      src = fetchTarball {
        url = "https://github.com/wlangstroth/vim-racket/archive/4dc9840cdcddf4740553c920f56435b0e016abb0.tar.gz";
        sha256 = "19ah9g8qi2gy1kfg7nh1cdjl7hyxk3pqd28in7jh5w760356zahg";
       };
      meta = {
        homepage = https://github.com/wlangstroth/vim-racket; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  
}
