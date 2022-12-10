{ pkgs
, go ? pkgs.go
}:

{
  buildInputs = with pkgs; [ go ];
}
