{ pkgs ? import ../nixpkgs {}
}:

with pkgs;

let
    core = callPackage ./default.nix {};
    go = callPackage ./default-go.nix {};
    python = callPackage ./default-python.nix {};
    node = callPackage ./default-node.nix {};
in
  {
    buildInputs = core.buildInputs ++ go ++ python ++ node;
  }
