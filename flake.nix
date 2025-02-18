{
  description = "A basic flake that provides apify related packages.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;
    in
    {
      overlays = import ./nix/overlays.nix {
        inherit
          self
          lib
          ;
      };
    };
}
