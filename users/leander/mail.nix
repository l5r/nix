
{ pkgs, config, ...}:
let
  credentials = import ./credentials.nix;
in
  {
    accounts.email = {
      accounts =
        builtins.mapAttrs
          (name: attrs: attrs // {notmuch.enable = true; offlineimap.enable = true;})
          credentials.email.accounts;
    };
    programs.astroid.enable = true;
    programs.notmuch.enable = true;
    programs.offlineimap.enable = true;
  }
