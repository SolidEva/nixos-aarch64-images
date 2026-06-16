{ stdenv, fetchurl, zstd }:
let
  # src = (builtins.fetchurl {
  #   # this is updated by ./scripts/upload-image.sh
  #   url = "file://home/eva/repos/nixos-aarch64-images/nixos-image-sd-card-26.05pre990025.15f4ee454b1d-aarch64-linux.img.zst";
  #   hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  # }).overrideAttrs (final: prev: {
  #   __structuredAttrs = true;
  #   unsafeDiscardReferences.out = true;
  # });
  src = /home/eva/repos/nixos-aarch64-images/nixos-image-sd-card-26.05pre990025.15f4ee454b1d-aarch64-linux.img.zst;
in
stdenv.mkDerivation {
  name = "aarch64-image";
  inherit src;
  preferLocalBuild = true;
  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  # Performance
  dontPatchELF = true;
  dontStrip = true;
  noAuditTmpdir = true;
  dontPatchShebangs = true;

  nativeBuildInputs = [
    zstd
  ];

  installPhase = ''
    zstdcat $src > $out
  '';
}
