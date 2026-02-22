# Aquí están todas las configuraciones de los siguientes servicios

# Virtualización
# MySQL
# Impresionta / Printing
# SearXNG
# Adguard

{ lib, config, pkgs, ... }:
{
## Virtualización
  environment.systemPackages = with pkgs; [
      ## 🔢 Virtualización y Emulación
      #virt-viewer spice spice-gtk spice-protocol win-virtio win-spice
      #swtpm lutris bottles ventoy-full
      virtiofsd virtio-win #waydroid

  ];
  virtualisation = {
    waydroid.enable = false;
    	libvirtd = {
      		enable = true;
      		onShutdown = "shutdown";
      		qemu = {
        		swtpm.enable = true;
        		#ovmf.enable = true;
        		#ovmf.packages = [ pkgs.OVMFFull.fd ];
      		};
	};
	docker = {
		enable = false;
    	};
	podman = {
		enable = false;
	};
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;




## MySQL
  services.mysql = {
    enable = false;
    package = pkgs.mariadb;
  };


## Impresora / Printing
  services.printing.enable = true;


## DNS
services.unbound = {
	enable = true;
	settings = {
		server = {
			interface = "";
			port = "";
			access-control = "";
			hide-identity = true;
			hide-version = true;
			prefetch = true;
			num-threads = 1;
			harden-glue = true;
        		harden-dnssec-stripped = true;
        		use-caps-for-id = false;
			tls-cert-bundle = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
		};
		forward-zone = [{
      				name = ".";
      				forward-addr = [""];
      				forward-tls-upstream = "yes";
  		}];
	};
};

services.adguardhome = {
	enable = true;
	host = "";
	port = "";
	settings = {
		dns = {
			bind_hosts = [""];
			upstream_dns = [""];
		};
		filtering = {
			protection_enabled = true;
			filtering_enabled = true;
			parental_enabled = false;
			safe_search.enabled = false;
		};
		filters = map(url: { enabled = true; url = url; }) [
			"https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
		];
	};
	openFirewall = true;
	
};




## SearXNG
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings = {
      general = {
        enable_metrics = true;
        instance_name = "SearXNG";
      };
      search = {
      	safe_search = 0;
	formats = [ "html" "json"];
      };
      server = {
        limiter = true;
        public_instance = false;
        image_proxy = true;
        method = "POST";
      };
      enabled_plugins = [
        "Basic Calculator"
        "Unit converter plugin"
        "Tor check plugin"
        "Tracker URL remover"
        "Open Access DOI rewrite"
      ];
      outgoing = {
        request_timeout = 15.0;
        max_request_timeout = 15.0;
        pool_connections = 100;
        pool_maxsize = 25;
        enable_http2 = true;
      };
      ui = {
        infinite_scroll = true;
        default_locale = "";
        query_in_title = true;
      };
      engines = [
      	# Buscadores Generales
      	{ name = "duckduckgo"; engine = "duckduckgo"; shortcut = "ddg"; }
      	{ name = "google"; engine = "google"; use_http = true; }
      	{ name = "brave"; engine = "brave"; }
      	{ name = "qwant"; engine = "qwant"; }
      	{ name = "mojeek"; engine = "mojeek"; disabled = true; }

      	# Wikis
      	{ name = "wikipedia"; engine = "wikipedia"; }
      	{ name = "wikivoyage"; engine = "wikidata"; disabled = true; }
      	{ name = "wikiversity"; engine = "wikidata"; }
	{ name = "wikidata"; engine = "wikidata"; disabled = true; }

      	# Programación
      	{ name = "stack overflow"; engine = "stackexchange"; }
      	{ name = "github"; engine = "github"; }
      	{ name = "nixos wiki"; engine = "mediawiki"; base_url = "https://wiki.nixos.org/"; }

      	# Imágenes
      	{ name = "bing images"; engine = "bing_images"; }
      	#{ name = "brave images"; engine = "brave"; } 
      	#{ name = "duckduckgo images"; engine = "duckduckgo_images"; }
      	{ name = "google images"; engine = "google_images"; }
      	{ name = "unsplash"; engine = "unsplash"; }

      	# Videos
      	#{ name = "youtube"; engine = "youtube"; }
      	#{ name = "invidious"; engine = "invidious"; }

      	# Extras
      	#{ name = "nyaa"; engine = "xpath"; }
      	#{ name = "library genesis"; engine = "libgen"; }
      	{ name = "openstreetmap"; engine = "openstreetmap"; }
      	#{ name = "wttr.in"; engine = "json_engine"; base_url = "https://wttr.in/?format=j1"; }
      ];         
    };
  };



}
