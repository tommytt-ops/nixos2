{
  description = "New flake using one of the NixOS configs from tommy-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    base-flake.url = "github:tommytt-ops/nixos";
  };

  outputs = { self, nixpkgs, tommy-config }:
    let
      laptopConfig = tommy-config.nixosConfigurations.laptop;
      basePy311 = base-flake.devShells."x86_64-linux".python311;
    in {
      nixosConfigurations.myLaptopSystem = laptopConfig;
      devShells."x86_64-linux".python311v1 = pkgs.mkShell {
        packages = basePy311.packages ++ [ pkgs.openssl ]; 
      };
    };
}
