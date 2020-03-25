{ pkgs, ...}@args:
(import ./plugins.nix args) //
(with pkgs.vimUtils; with pkgs; {
  # Get sha256 by running
  # nix-prefetch-url --unpack https://github.com/[owner]/[name]/archive/[rev].tar.gz
})

