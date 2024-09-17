# shell.nix

{ pkgs ? import <nixpkgs> {} }:


pkgs.mkShell {
  packages = with pkgs; [ 
    qtspim # For cmsc411
  ];
}

