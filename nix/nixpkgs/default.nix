# This file is the source of truth when it comes to versioning packages
{ overlays ? []
, ...
}@args:

let
  sources = import ../sources.nix;
  nixpkgs = sources.nixpkgs;

  # https://nixos.wiki/wiki/Overlays
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

    # https://nixos.org/manual/nixpkgs/stable/#sec-pkg-overrideAttrs
    yarn = prev.yarn.overrideAttrs (_final: { buildInputs = [ nodejs ]; });
  };
in
  import nixpkgs (args // { overlays = [ overlay ] ++ overlays; })
