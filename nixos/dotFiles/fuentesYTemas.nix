{ config, pkgs, lib, ... }:

{
  # Fuentes
  home.packages = with pkgs; [
    font-awesome noto-fonts noto-fonts-color-emoji
    nerd-fonts.hack fira-code fira-code-symbols
  ];      
  fonts.fontconfig.enable = true;


# Temas
	home.sessionVariables = {
  		GTK_THEME = "Graphite-Dark-Compact-Blur:dark";
	};
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
  	  package = pkgs.graphite-gtk-theme;
   		name = "Graphite-Dark-Compact-Blur";
   	};
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "Noto Sans";
      size = 10;
    };
   };

}
