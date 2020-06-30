
{ pkgs, swaylock-fancy, ... }:
(pkgs.writeShellScriptBin "lock"
''
  ${swaylock-fancy}/bin/swaylock-fancy $@
'')

