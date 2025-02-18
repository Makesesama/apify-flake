{
  buildPythonPackage,
  fetchPypi,

  poetry-core,

  apify-shared,
  httpx,
  more-itertools,
}:
let
  pname = "apify_client";
  version = "1.9.1";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-qtqlgAhFyhxbHHQW8jNYzB/L0qqwNVIeQCNfM3IeKiY=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    apify-shared
    httpx
    more-itertools
  ];
}
