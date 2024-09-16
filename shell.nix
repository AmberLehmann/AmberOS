# shell.nix

{ pkgs ? import <nixpkgs> {} }:

{
  pkgs.mkShell = {
    packages = with pkgs; [ 
      
      julia_19-bin # For cmsc460
      vimPlugins.julia-vim # For cmsc460
      qtspim # For cmsc411
      
    ];
  };
}
