# Aquí está toda la configuración y paquetes relacionados
# a hardware y programas de bajo nivel

# Power Management
# Discos
# Drivers y Controladores

{lib, config, pkgs, ... }:
{
## Power Management
	services.power-profiles-daemon.enable = false;
	services.thermald.enable = false;
	powerManagement.enable = true;
	services.tlp = {
		enable = true;
		settings = {
			CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

			CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
			CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

			CPU_MIN_PERF_ON_AC = 0;
			CPU_MAX_PERF_ON_AC = 100;
			CPU_MIN_PERF_ON_BAT = 0;
			CPU_MAX_PERF_ON_BAT = 50;

			START_CHARGE_THRESH_BAT0 = 40;
			STOP_CHARGE_THRESH_BAT0 = 80;
		};
	};

  # Ventiladores OMEN
	security.sudo = {
		enable = true;
		#extraRules = [
		# {
		#  users = ["nekonix"];
		#  commands = [
		#   {
		#    command = "/home/nekonix/configNix/scripts/ventiladores.sh";
		#    options = [ "NOPASSWD" "SETENV" ];
		#   }
		#  ];
		# }
		#]; 
	};


## Discos 

	services.udisks2.enable = true;
	services.dbus.enable = true;
	services.gvfs.enable = true;




## Drivers y Controladores
	hardware.amdgpu.opencl.enable = true;
	services.hardware.openrgb.enable = false;
	hardware.opentabletdriver = {
		enable = true;
		daemon.enable = true;
	};


	hardware.graphics = {
		enable = true;
		package = pkgs.mesa;
		#extraPackages = [pkgs.rocmPackages.clr];
	};
  
}
