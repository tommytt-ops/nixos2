{
  description = "New flake using one of the NixOS configs from tommy-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    tommy-config.url = "github:tommytt-ops/nixos";
  };

  outputs = { self, nixpkgs, tommy-config }:
    let
      laptopConfig = tommy-config.nixosConfigurations.laptop;
    in {
      nixosConfigurations.myLaptopSystem = laptopConfig;
    };
}
