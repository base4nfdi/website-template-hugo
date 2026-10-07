{
  description = "Nix development environment for the Base4NFDI Hugo website template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };


  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = lib.genAttrs systems;
      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          config = { };
          overlays = [ ];
        };
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
          hugo = pkgs.callPackage ./nix/hugo-extended.nix { };
        in
        {
          inherit hugo;
          default = hugo;
        }
      );

      apps = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
          hugo = self.packages.${system}.hugo;
          serve = pkgs.writeShellApplication {
            name = "hugo-serve";
            runtimeInputs = [
              hugo
              pkgs.go
              pkgs.git
            ];
            text = ''
              export HUGO_CACHEDIR="''${HUGO_CACHEDIR:-$PWD/.hugo-cache}"
              exec hugo server --bind 127.0.0.1 --port 1313 "$@"
            '';
          };
        in
        {
          default = {
            type = "app";
            program = lib.getExe serve;
          };
          serve = {
            type = "app";
            program = lib.getExe serve;
          };
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
          hugo = self.packages.${system}.hugo;
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              hugo
              pkgs.go
              pkgs.git
            ];

            shellHook = ''
              export HUGO_CACHEDIR="''${HUGO_CACHEDIR:-$PWD/.hugo-cache}"
              echo "Hugo $(hugo version)"
              echo
              echo "Start the site:"
              echo "  hugo server"
              echo "  hugo server -D          # include draft pages"
              echo "  nix run                 # same as: hugo server --bind 127.0.0.1 --port 1313"
              echo
              echo "Production-style build (as in GitHub Actions):"
              echo "  hugo --minify"
            '';
          };
        }
      );
    };
}
