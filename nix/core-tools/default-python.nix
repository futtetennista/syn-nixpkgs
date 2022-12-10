{ pkgs
, python ? pkgs.python39
}:

{
  buildInputs = with pkgs; [ python ];
}
