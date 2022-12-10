{ pkgs
, go ? pkgs.go
}:

{
  pkgs = with pkgs; [ go ];
}
