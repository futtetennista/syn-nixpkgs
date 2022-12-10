{ pkgs
, nodejs ? pkgs.nodejs
, yarn ? pkgs.yarn
}:

{
  pkgs = with pkgs; [ nodejs yarn ];
}
