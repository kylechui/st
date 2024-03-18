{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShell.${system} = pkgs.mkShell {
        packages =
          [
            pkgs.pkg-config
            pkgs.ncurses
            pkgs.fontconfig
            pkgs.freetype
          ]
          ++ [
            pkgs.xorg.libX11
            pkgs.xorg.libXft
          ];
      };
    };
}
