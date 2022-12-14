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

  pkgs-syn = {
    core-tools = pkgs.callPackage ./core {};
    node-tools = pkgs.callPackage ./node {};
    python-tools = pkgs.callPackage ./python {};
    go-tools = pkgs.callPackage ./go {};
    cloud-tools = pkgs.callPackage ./cloud {};
  };
in
  pkgs // pkgs-syn
