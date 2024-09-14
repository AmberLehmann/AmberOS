{ pkgs, ... }:

{
  environment.systemPackage = with pkgs; [
    biber
    texlab
    texLiveMedium
  ];
}
