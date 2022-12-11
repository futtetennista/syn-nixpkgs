{ pkgs ? import ./nix/nixpkgs {}
}:

with pkgs;

mkShell {
  buildInputs = [
    core-tools
    node-tools
    python-tools
    go-tools
    cloud-tools
  ];
}
