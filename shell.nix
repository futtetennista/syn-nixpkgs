{ pkgs ? import ./nix/nixpkgs {}
}:

with pkgs;

mkShell {
  buildInputs = [
    syn-core-tools
    syn-node-tools
    syn-python-tools
    syn-go-tools
    syn-infra-tools
  ];
}
