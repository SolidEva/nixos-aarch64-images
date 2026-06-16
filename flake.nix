{
  description = "Build NixOS images for various ARM single computer boards";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }: {
    packages.x86_64-linux = import ./. {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
  };
}
