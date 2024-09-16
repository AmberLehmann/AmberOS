{
  description = "Amber's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    plugin-candyland.url = "github:AmberLehmann/candyland.nvim";
    plugin-candyland.flake = false;
  };

  outputs = {self, nixpkgs, ... } @ inputs: 
    let 
      system = "x84_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in {
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
          ./configuration.nix
          ./display-manager.nix
          ./gc.nix
          ./latex.nix
          ./sound.nix
          ./user.nix
        ];
      };
    };
}
