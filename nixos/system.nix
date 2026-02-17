# Este módulo contiene configuración de:

# Bootloader
# Nix package manager
# Seguridad y Polkit
{ lib, config, pkgs, ... }:

{

## Bootloader
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      default = 0;
      #theme = "${pkgs.catppuccin-grub}";
      splashImage = /home/nekonix/wallpapers/Kath.png;
      efiInstallAsRemovable = false;
    };
  };

## Nix
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
	};

	# Por defecto se instala el último Kernel LTS
	#boot.kernelPackages = pkgs.linuxPackages_latest;

	#services.fwupd.enable = true;
## Seguridad
# Límite de archivos abiertos
  security.pam.loginLimits = [
      { domain = "*"; type = "hard"; item = "nofile"; value = "32768"; }
      { domain = "*"; type = "soft"; item = "nofile"; value = "32768"; }
  ];
# Polkit
	security.polkit.enable = true;

}
