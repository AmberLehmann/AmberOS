{
  description = "Amber's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # plugin-candyland.url = "github:AmberLehmann/candyland.nvim";
    # nix-ld.url = "github:Mic92/nix-ld";
    # nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    # plugin-candyland.flake = true;
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
                          #v nix-ld,
  outputs = {self, nixpkgs, ... } @ inputs: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in {
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
          ./configuration.nix    # Houses home.nix
          ./display-manager.nix  
          ./gc.nix               # Garbage collector
          ./latex.nix
          ./sound.nix
          ./user.nix
          # nix-ld.nixosModules.nix-ld
          # The module in this repository defines a new module under (programs.nix-ld.dev) instead of (programs.nix-ld)
          # to not collide with the nixpkgs version.
          # { programs.nix-ld.dev.enable = true; }
        ];
      };
    };
}
