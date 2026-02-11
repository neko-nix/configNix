{
  description = "Plantilla de flake";

  inputs = {
    # Cambiar la versión de nixpkgs según corresponda
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system;
                                config.allowUnfree = true;
                              };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Paquetes de NixOS
            hello
            #sqlite
            #vscodium
            #git

            # Versión de python a instalar
            #python312
            # Paquetes de python a instalar
            #(python312.withPackages (ps: with ps; [
            #  pandas numpy matplotlib
            #  yfinance plotly
            #  requests
            #  pytest
            #  seaborn
            #  tabulate 
            #]))
          ];

          # Script del shell a ejecutar cuando se utilize `nix develop`
          shellHook = ''
                      hello
                      echo "Entorno de desarrolo activado :D"                      

                      # Borrar los caches de python
                      # find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null

                      # Generar el tree del proyecto
                      # tree -v --dirsfirst -I "flake.lock|apuntes.md|CHANGELOG.md|README.md|LICENSE"
                      # Genera tree ignorando archivos de python
                      # tree -v --dirsfirst -I "__pycache__|__init__.py|__main__.py|flake.lock|apuntes.md|CHANGELOG.md|README.md|LICENSE"
          '';                           

        };
      });
}