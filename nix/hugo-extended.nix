{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:

# Official Hugo Extended binaries, pinned to the version used by
# .github/workflows/publish.yaml (WC_HUGO_VERSION). Current nixpkgs Hugo is
# far newer and breaks this HugoBlox v5 template (e.g. `paginate`).
let
  version = "0.122.0";

  sources = {
    x86_64-linux = {
      url = "https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_extended_${version}_linux-amd64.tar.gz";
      hash = "sha256-bJuoWaFwr4u/uBl/M0mdC9B79wdkNtGsl3X59J1DThA=";
    };
    aarch64-linux = {
      url = "https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_extended_${version}_linux-arm64.tar.gz";
      hash = "sha256-3B7a7SXCJrvJr2Gk0+tFpKB7u5pEw3JsA8isHg7jCRo=";
    };
    x86_64-darwin = {
      url = "https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_extended_${version}_darwin-universal.tar.gz";
      hash = "sha256-aY9nRgwGC2VrFSLoKEdawtIJAViOGe+7KUUN03ZRBE0=";
    };
    aarch64-darwin = {
      url = "https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_extended_${version}_darwin-universal.tar.gz";
      hash = "sha256-aY9nRgwGC2VrFSLoKEdawtIJAViOGe+7KUUN03ZRBE0=";
    };
  };

  srcMeta =
    sources.${stdenv.hostPlatform.system}
      or (throw "Hugo ${version} extended is not packaged for ${stdenv.hostPlatform.system}");
in
stdenv.mkDerivation {
  pname = "hugo";
  inherit version;

  src = fetchurl {
    inherit (srcMeta) url hash;
  };

  nativeBuildInputs = lib.optionals stdenv.hostPlatform.isLinux [ autoPatchelfHook ];
  buildInputs = lib.optionals stdenv.hostPlatform.isLinux [ stdenv.cc.cc.lib ];

  sourceRoot = ".";
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 hugo $out/bin/hugo
    runHook postInstall
  '';

  meta = {
    description = "Hugo Extended ${version} (matches this site's GitHub Actions version)";
    homepage = "https://gohugo.io";
    changelog = "https://github.com/gohugoio/hugo/releases/tag/v${version}";
    license = lib.licenses.asl20;
    mainProgram = "hugo";
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = builtins.attrNames sources;
  };
}
