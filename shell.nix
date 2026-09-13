# `nix-shell` entrypoint that uses the same environment as `nix develop`.
# Requires flakes (`nix.settings.experimental-features = [ "nix-command" "flakes" ];`).
let
  flake = builtins.getFlake (toString ./.);
in
flake.devShells.${builtins.currentSystem}.default
