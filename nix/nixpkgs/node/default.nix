{ pkgs
, nodejs ? pkgs.nodejs
, yarn ? pkgs.yarn
}:

with pkgs;

[ nodejs yarn ]
