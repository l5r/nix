
{ pkgs, config, ... }: 
let
  python = (pkgs.python27.override {
    packageOverrides = python-self: python-super: {

      gdrivefs = python-super.gdrivefs.overridePythonAttrs (oldAttrs: rec {
        version = "0.14.13";
        src = pkgs.fetchurl {
          url = "https://github.com/dsoprea/GDriveFS/archive/${version}.tar.gz";
          sha256 = "0545fzij1ihk5dgl5pmlvnfgciqj6cs0736qn023w8kwxdj4v6h9";
        };
        propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [ python-self.oauth2client ];
      });

      oauth2client = (python-super.oauth2client.overridePythonAttrs (oldAttrs: rec {
        version = "3.0.0";
        src = pkgs.python27Packages.fetchPypi {
          pname = oldAttrs.pname;
          inherit version;
          sha256 = "0q143a6ilm5i8c5d1pgklz8p3yjps5dqhcmn41wlwc7jqrp0ansv";
        };
      }));

    };
  });
in
{
  home.packages = [
    python.pkgs.gdrivefs
  ];
}

