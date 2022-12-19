{ pkgs
, gcloud_sdk ? true
}:

with pkgs;

let
  core = [
    git
    gh
    jq
    parallel
    yq-go
  ];

  cloud = if gcloud_sdk then [ gcloud-sdk ] else [];

  containers = [ docker docker-compose ];

  vendor = [
    vendored.postgresql
  ];
in
  core ++ cloud ++ containers ++ vendor
