{
  self,
  lib,
}:
{
  default = lib.composeManyExtensions (
    with self.overlays;
    [
      python-packages
      other-packages
    ]
  );

  python-packages = (
    final: # package set with all overlays applied, a "fixed" point
    prev: # state of the package set before applying this overlay
    {
      pythonPackagesOverlays = (prev.pythonPackagesOverlays or [ ]) ++ [
        (python-final: python-prev: {
          # cviz = python-final.callPackage cvizPkg { };
          # ...
          apify-shared = python-final.callPackage ./packages/apify-shared.nix { };
          apify-client = python-final.callPackage ./packages/apify-client.nix { };

          crawlee = python-final.callPackage ./packages/crawlee.nix { };
          apify = python-final.callPackage ./packages/apify-py.nix { };
        })
      ];

      python3 = prev.python3.override {
        packageOverrides = prev.lib.composeManyExtensions final.pythonPackagesOverlays;
      };

      python3Packages = final.python3.pkgs;
    }
  );
  other-packages = (final: prev: { apify = final.callPackage ./packages/apify-cli/apify.nix { }; });
}
