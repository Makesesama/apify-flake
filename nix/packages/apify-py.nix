{
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  websockets,
  cryptography,
  httpx,
  more-itertools,
  typing-extensions,
  crawlee,
  apify-client,
  apify-shared,
  lazy-object-proxy,
}:
let
  pname = "apify";
  version = "2.2.1";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-mjCCjl+QjAIOhfwU9wx06JCrGyAVfOILUNGZVksS1kk=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    websockets
    cryptography
    httpx
    more-itertools
    typing-extensions
    crawlee
    apify-client
    apify-shared
    lazy-object-proxy
  ];
}
