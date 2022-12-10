{ pkgs
, gcloud_sdk ? true
, azure_cli ? true
, drone_cli ? true
, python ? pkgs.python39
}:

with pkgs;

let
  core = [
    git
    gh
    jq
    parallel
    yq-go
  ] ++ (if python == null then [] else [python]);
  
  cloud = [
    kubectl
  ] ++ (if drone_cli then [ drone-cli ] else [])
  ++ (if gcloud_sdk then [ gcloud-sdk ] else [])
  ++ (if azure_cli then [ azure-cli ] else []);
  
  containers = [ lima colima docker ];
  
  vendor = [
    vendored.postgresql
  ];
in
  {
    buildInputs = core ++ cloud ++ containers ++ vendor;
  }
