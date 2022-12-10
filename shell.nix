{ pkgs ? import ./nix/nixpkgs {}
}:

with pkgs;

let
  core = callPackage ./nix/tools/core {};
  go = callPackage ./nix/tools/go {};
  infra = callPackage ./nix/tools/infra {};
  node = callPackage ./nix/tools/node {};
  python = callPackage ./nix/tools/python {};
in
  mkShell {
    buildInputs = (
      core.pkgs
      ++ go.pkgs
      ++ infra.pkgs
      ++ node.pkgs
      ++ python.pkgs
    );
  }
