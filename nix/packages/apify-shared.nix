{
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:
let
  pname = "apify_shared";
  version = "1.2.1";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-mGVX4rAcWEqlclj7Svg9Muy2l5wNgEzL/afA55otALE=";
  };

  build-system = [
    setuptools
  ];

  # nativeBuildInputs = [
  #   poetry-core
  # ];

  propagatedBuildInputs = [

  ];
}
