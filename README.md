# How to run
1. Add input to nix flake:

```nix
inputs = {
    apify-flake.url = "github:Makesesama/apify-flake";
};
```
2. Add overlay to nixpkgs:

```nix
pkgs = import nixpkgs {
    inherit system;
    overlays = [
        apify-flake.overlays.default
    ];
};
```
3. Use packages:

```nix
default = pkgs.mkShell {
    packages = [
        pkgs.apify
    ];
};
```
