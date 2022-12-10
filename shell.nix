{ pkgs ? import ./nix/nixpkgs { } }:

with pkgs;

let
  nix-pre-commit-hooks = import (fetchTarball "https://github.com/cachix/pre-commit-hooks.nix/tarball/master");

  pre-commit-check = nix-pre-commit-hooks.run {
    src = ./.;

    hooks = {
      # shellcheck.enable = true;
      nix-linter.enable = false;
      nixpkgs-fmt.enable = false;
    };
  };

  core-tools = callPackage ./nix/core-tools { gcloud_sdk = false; azure_cli = false; };
in
  mkShell {
    buildInputs = core-tools.buildInputs;

    USE_NIX = 1;

    shellHook = ''
      ${pre-commit-check.shellHook}
    '';
  }
