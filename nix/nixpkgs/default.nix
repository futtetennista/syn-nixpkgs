# This file is the source of truth when it comes to versioning packages
{ overlays ? []
, ...
}@args:

let
  sources = import ../sources.nix;
  nixpkgs = sources.nixpkgs;

  overlay = _final: prev: rec {
    vendored = {
      postgresql = prev.callPackage ./vendor/postgresql {
        postgresql = prev.postgresql_12;
      };
    };

    gcloud-sdk = prev.google-cloud-sdk.withExtraComponents [
      prev.google-cloud-sdk.components.gke-gcloud-auth-plugin
    ];

    nodejs = prev.nodejs-16_x;

    yarn = prev.yarn.override { inherit nodejs; };

    python = prev.python39;

    go = prev.go;
  };

  pkgs = import nixpkgs (args // { overlays = [ overlay ] ++ overlays; });

  syn-pkgs = {
    syn-core-tools = pkgs.callPackage ./collections/core {};
    syn-node-tools = pkgs.callPackage ./collections/node {};
    syn-python-tools = pkgs.callPackage ./collections/python {};
    syn-go-tools = pkgs.callPackage ./collections/go {};
    syn-infra-tools = pkgs.callPackage ./collections/infra {};
  };
in
  pkgs // syn-pkgs
