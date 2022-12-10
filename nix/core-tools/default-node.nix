{ pkgs
, nodejs ? pkgs.nodejs
, yarn ? pkgs.yarn
}:

{
  buildInputs = with pkgs; [ nodejs yarn ];
}
