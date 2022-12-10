{ pkgs
, python ? pkgs.python39
}:

{
  pkgs = with pkgs; [ python ];
}
