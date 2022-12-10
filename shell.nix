{ pkgs ? import ./nix/nixpkgs { } }:

with pkgs;

let
  core-tools = callPackage ./nix/core-tools { };
in
mkShell {
  buildInputs = core-tools.buildInputs;

  USE_NIX = 1;

  shellHook = ''
    ${(import ./default.nix).pre-commit-check.shellHook}
  '';
}
