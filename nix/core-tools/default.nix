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

  containers = [ lima colima docker ];

  vendor = [
    vendored.postgresql
  ];
in
  {
    buildInputs = core ++ cloud ++ containers ++ vendor;
  }
