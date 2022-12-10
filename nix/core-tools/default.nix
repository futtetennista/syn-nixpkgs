{ pkgs }:


{
  buildInputs = with pkgs; [
    # vendored.postgresql

    git
    # gh
    # gcloud-sdk
    # python39
    # lima
    # colima
    # docker
    # azure-cli
    # kubectl
    # yq-go
    # jq
    # drone-cli
    # parallel
  ];
}
