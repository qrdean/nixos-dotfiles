{
  description = "Flake from scratch";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    helium-55e98df.url = "github:vikingnope/helium-browser-nix-flake/55e98df9fdaf731667d0667f64b9dda0fbbdbe14";
    helium-55e98df.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      helium-55e98df,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit helium-55e98df;
          inherit nixpkgs-unstable;
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.qdean = import ./home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
          }
        ];
      };
    };
}
