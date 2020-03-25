{ pkgs, ...}:
with pkgs.vimUtils; with pkgs; {
  # Get sha256 by running
  # nix-prefetch-url --unpack https://github.com/[owner]/[name]/archive/[rev].tar.gz

  neoranger = buildVimPluginFrom2Nix {
    name = "neoranger";
    src = fetchFromGitHub {
      owner = "Lokaltog";
      repo = "neoranger";
      rev = "5edfbdd5c14d589f4f57ba1dab28a9072107cb83";
      sha256 = "1s4r868w98890d5lp0spf37bfv6sb6z4an3p3q14fwd2sb0ysq8f";
    };
  };
}

