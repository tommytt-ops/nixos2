{
  description = "New flake using one of the NixOS configs from tommy-config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    baseFlake.url = "github:tommytt-ops/nixos";
  };

  outputs = { self, nixpkgs, baseFlake }:
    let
      laptopConfig = baseFlake.nixosConfigurations.laptop;
      basePy311 = baseFlake.devShells."x86_64-linux".python311;
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
      nixosConfigurations.myLaptopSystem = laptopConfig;
      devShells."x86_64-linux".python311v1 = pkgs.mkShell {
        inputsFrom = [ basePy311 ];
        packages = [ pkgs.openssl ]; 
        shellHook = '' ssh -o StrictHostKeyChecking=no adminuser@52.166.187.169 '';
      };
    };
}
