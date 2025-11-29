{
   description = "Flake from scratch";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.05";
      home-manager.url = "github:nix-community/home-manager/release-25.05";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
   };

   outputs = { self, nixpkgs, home-manager, ... }: {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
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
