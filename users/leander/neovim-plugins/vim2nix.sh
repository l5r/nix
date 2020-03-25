#!/usr/bin/env sh
# Simple script to create a buildVimPlugin drv for NixOs
# JagaJaga 2014
# Usage ./vim2nix.sh repoOwner/repoName (only github is supported)
# Deps: nix-prefetch-scripts

get_plugin_entry() {

  owner=$(echo "$1" | sed 's/\(.*\)\/\(.*\)/\1/g')
  repo=$(echo "$1" | sed 's/\(.*\)\/\(.*\)/\2/g')
  homepage="https://github.com/"$1
  rep=$homepage.git
  rev=$(git ls-remote "$rep" | head -1 | cut -f1)
  name=$(echo "$repo" | sed 's/vim-\(.*\)/\1/g' | sed 's/\(.*\)\.vim/\1/g')
  #basename=$(echo $name | sed 's/\([a-zA-Z]\+\)[-_\.]\([a-zA-Z]\)\([a-zA-Z]\+\)/\1\U\2\L\3/g')
  tarball=$homepage/archive/$rev.tar.gz
  hash=$(nix-prefetch-url --unpack $tarball)
  git clone --depth=1 $rep $name
  cd $name
  version=$(git log -n 1 --pretty=format:"%ci" | sed 's/\([0-9-]\)\s.*/\1/g')
  cd ../
  rm -rf $name

  echo "
    $name = buildVimPluginFrom2Nix {
      name = \"$name-git-$version\";
      src = fetchTarball {
        url = \"$tarball\";
        sha256 = \"$hash\";
       };
      meta = {
        homepage = $homepage; 
        maintainers = [ stdenv.lib.maintainers.jagajaga ];
      };
    };
  "
}

cd $(dirname $0)

echo "
{ pkgs, ...}:
with pkgs.vimUtils; with pkgs; {
" > plugins.nix

while read plugin
do
  get_plugin_entry $plugin
done < plugins.txt >> plugins.nix

echo "}" >> plugins.nix

