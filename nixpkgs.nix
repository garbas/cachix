# to update: $ nix-prefetch-url --unpack url
let
  fetchTarball = { url, sha256 }@attrs:
    if builtins.lessThan builtins.nixVersion "1.12"
    then builtins.fetchTarball { inherit url; }
    else builtins.fetchTarball attrs;
in import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/932e0f30c4100334684612c56003bd4a2e3451eb.tar.gz";
  sha256 = "1w2481slpvir1kzhf1bsgi5zj9avspvdhsdzyvw5az78l3bmy5hy";
}) { config = {}; overlays = []; }
