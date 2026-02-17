{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz;
  #home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz;
in

{
  #programs.home-manager.enable = true;

  users.users.nekonix = {
    isNormalUser = true;
    home = "/home/nekonix";
  };

  imports =
    [
      (import "${home-manager}/nixos")
    ];

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nekonix = { pkgs, ... }: {
      # La versión del canal nixos y home-manager deben coincidir
      home.stateVersion = "25.05";
      imports = [
        ./dotFiles/swaylock.nix
        ./dotFiles/cava.nix
        ./dotFiles/dunst.nix
        ./dotFiles/waybar.nix
        ./dotFiles/hyprland.nix
        ./dotFiles/kitty.nix
        ./dotFiles/rofi.nix
        ./dotFiles/fuentesYTemas.nix
        ./dotFiles/navegadores.nix
        ./dotFiles/neovim.nix
        ./dotFiles/git.nix

        # Glava tiene problemas para ser configurado de forma declarativa
        #./dotFiles/glava/bars.nix
        #./dotFiles/glava/circle.nix
        #./dotFiles/glava/envs.nix
        #./dotFiles/glava/glava.nix
        #./dotFiles/glava/graph.nix
        #./dotFiles/glava/radial.nix
        #./dotFiles/glava/util.nix
        #./dotFiles/glava/wave.nix
      ];
    };     
  };  
}
