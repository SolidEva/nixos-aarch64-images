{
  description = "Build NixOS images for various ARM single computer boards";
  # pin this to unstable
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }: {
    packages.x86_64-linux = import ./. {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
  };
}
