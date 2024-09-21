{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    biber
    texlab
    texliveMedium
  #   texlivePackages.latexmk
  #   texlivePackages.latexcolors
  #   texlivePackages.nag
  #   texlivePackages.tilings
  ];
}
