{
  description = "Amber's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, ... }@inputs: 
      let 
        system = "x84_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        lib = nixpkgs.lib;
      in {
        devShells.x84_64-linux.default = ( import ./shell.nix { inherit pkgs; });
        nixosConfigurations.nixos = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ 
            ./configuration.nix
            ./gc.nix
            ./sound.nix
          ];
        };
      };
}
