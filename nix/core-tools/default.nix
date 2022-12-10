{ pkgs
, gcloud_sdk ? false
, azure_cli ? false
, drone_cli ? false
}:

with pkgs;

let
  core = [
    git
    gh
    jq
    # parallel
    # python39
    yq-go
  ];
  cloud = [
    kubectl
    ]
    ++ (if drone_cli then [ drone-cli ] else [])
    ++ (if gcloud_sdk then [ gcloud-sdk ] else [])
    ++ (if azure_cli then [ azure-cli ] else []);
  container = [ lima colima docker ];
  vendor = [
    vendored.postgresql
  ];
in
  {
    buildInputs = core ++ cloud ++ container ++ vendor;
  }
