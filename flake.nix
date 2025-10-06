{
  description = "DevShell Node.js & pnpm (nixos-unstable)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        node = pkgs.nodejs_24;
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            node
            pkgs.pnpm
          ];
        };
      });
}
