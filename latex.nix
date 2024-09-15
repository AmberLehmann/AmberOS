{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    biber
    texlab
    texliveMedium
  ];
}
