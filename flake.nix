{
   description = "Flake from scratch";

   inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.11";
      home-manager.url = "github:nix-community/home-manager/release-25.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      helium-55e98df.url = "github:vikingnope/helium-browser-nix-flake/55e98df9fdaf731667d0667f64b9dda0fbbdbe14";
      helium-55e98df.inputs.nixpkgs.follows = "nixpkgs";
   };

   outputs = { self, nixpkgs, home-manager, helium-55e98df, ... }: {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit helium-55e98df; };
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
