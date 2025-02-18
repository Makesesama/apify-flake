{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchYarnDeps,
  yarnConfigHook,
  yarnBuildHook,
  yarnInstallHook,
  nodejs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "apify-cli";
  version = "0.21.1";

  src = fetchFromGitHub {
    owner = "apify";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-wjdl3/fxJThlfIldcRuP86UyZS/VEWMgr+i4hJtRCVw=";
  };

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = ./yarn.lock;
    hash = "sha256-3JewZ9nBbcY7d+z7lKOvFc2J103IYmBDHaXjo3nWPss=";
  };

  patches = [
    ./apify.patch
    ./lock.patch
  ];
  nativeBuildInputs = [
    yarnConfigHook
    yarnBuildHook
    yarnInstallHook
    # Needed for executing package.json scripts
    nodejs
  ];

  meta = {
    # ...
  };
})
