{
  buildPythonPackage,
  fetchPypi,
  poetry-core,

  # apify,
  colorama,
  cookiecutter,
  docutils,
  eval-type-backport,
  httpx,
  inquirer,
  more-itertools,
  psutil,
  pydantic,
  pydantic-settings,
  pyee,
  sortedcollections,
  tldextract,
  typer,
  typing-extensions,
  yarl,
}:
let
  pname = "crawlee";
  version = "0.5.4";
in
buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-JLLBjnhPyUrfs8fwYblpTlFIwwULJ5NJgBlxro8NsNk=";
  };

  # patches = [ "./crawlee.patch" ];
  pythonRemoveDeps = [
    "apify"
  ];
  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    # apify
    colorama
    cookiecutter
    docutils
    eval-type-backport
    httpx
    inquirer
    more-itertools
    psutil
    pydantic
    pydantic-settings
    pyee
    sortedcollections
    tldextract
    typer
    typing-extensions
    yarl
  ];

  doCheck = true;
}
