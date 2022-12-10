{ pkgs
, azure_cli ? true
, drone_cli ? true
}:

with pkgs;

let
  cloud-tools = [
    kubectl
  ] ++ (if drone_cli then [ drone-cli ] else [])
  ++ (if azure_cli then [ azure-cli ] else []);
in
  {
    pkgs = cloud-tools;
  }
