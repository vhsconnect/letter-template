{
  description = "Quick cover letters with latex";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.nixpkgsRegistry.url = "nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:

    let
      sys = {
        x86_64-linux = "x86_64-linux";
        aarch64-linux = "aarch64-linux";
        aarch64-darwin = "aarch64-darwin";
      };
      systems = [
        sys.aarch64-linux
        sys.aarch64-darwin
        sys.x86_64-linux
      ];
    in
    flake-utils.lib.eachSystem systems
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs;
              [
                texlive.combined.scheme-medium
                glibcLocales
                evince
              ];
            shellHook = ''
        '';

          };
        });
}
