# Aquí hay configs y paquetes relacionados
# a la experiencia del usuario.

# Desktop Environment
# Display Manager
# Audio
# Locale
# Git
# Fuentes

{ lib, config, pkgs, ... }:
{ 

## Desktop Environment y Display Manager
	#environment.systemPackages = [(
  	#	pkgs.catppuccin-sddm.override {
    	#	flavor = "mocha";
    	#	font  = "Noto Sans";
    	#	fontSize = "9";
    	#	background = "${/home/nekonix/wallpapers/Kath.png}";
    	#	loginBackground = true;
  	#	}
	#)];

	# Esto habilita GNOME y KDE Plasma.
	services = {
		xserver = {
			enable = true;
			displayManager.lightdm.enable = false;
			xkb.layout = "latam";
			xkb.variant = "";
		};
		displayManager = {
			#sddm.enable = true;
			#gdm.enable = true;
			#sddm.theme = "catppuccin-mocha";
			#sddm.package = pkgs.kdePackages.sddm;
		};
		desktopManager = {
			#plasma6.enable = true;
			#gnome.enable = true;
		};
	};

	# Esto habilita Hyprland.
	# Tener en cuenta que hay que agregar varias cosas si usas NVIDIA
	programs.hyprland.enable = true;
	programs.hyprlock.enable = true;
	security.pam.services.hyprlock = {};

	qt.enable = true;


	# XDG Portal
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [
		pkgs.xdg-desktop-portal-gtk
		pkgs.xdg-desktop-portal-hyprland
		pkgs.kdePackages.xdg-desktop-portal-kde
		];


## Audio y Bluetooth
	#hardware.bluetooth.enable = true;
	#services.blueman.enable = true;

	services.pulseaudio.enable = false;
	#sound.enable = true;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		wireplumber.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};


## Time zone, locale y keyboard layout
	# Set your time zone.


	# Este es para que no se desincronice el tiempo cuando está con dualBoot con Windows
	time.hardwareClockInLocalTime = true;


## Usuario
	users.users.nekonix = {
		isNormalUser = true;
		description = "NekoNix";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};


## Git
	programs.ssh = {
		startAgent = true;
		#extraConfig = ''
		#	Host github.com
		#	AddKeysToAgent yes
		#	IdentityFile ~/.ssh/id_ed25519
		#	IdentityFile ~/.ssh/id_ed25519_signing
		#'';
	};


## Fuentes y caracteres
	fonts.packages = with pkgs ; [
		font-awesome
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
		liberation_ttf
		fira-code
		fira-code-symbols
		mplus-outline-fonts.githubRelease
		dina-font
		proggyfonts
	];


}
