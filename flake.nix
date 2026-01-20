{
   description = "Flake from scratch";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      home-manager.url = "github:nix-community/home-manager/release-25.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      helium.url = "github:vikingnope/helium-browser-nix-flake";
      helium.inputs.nixpkgs.follows = "nixpkgs";
   };

   outputs = { self, nixpkgs, home-manager, helium, ... }: {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit helium; };
        modules = [
           ./configuration.nix
           home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.qdean = import ./home.nix;
              home-manager.backupFileExtension = "backup";
           }
        ];
      };
   };
}
