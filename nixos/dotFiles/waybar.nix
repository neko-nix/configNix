{ config, pkgs, lib, ... }:

{

programs.waybar = {

  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      margin-bottom = -1;
      modules-left = [ "clock" "custom/weather" "hyprland/workspaces" "hyprland/window"];
      #modules-center = [ ];
      modules-right = [ "network" "cpu" "temperature" "custom/ventiladores" "memory"
                      "pulseaudio" "cava" "custom/spotify" "battery"];
      fixed-center = false;


      ## Módulos de la izquierda
      clock = {
        format = "{:%F   %R}  ";
        interval = 1;
      };

      "custom/weather" = {
        exec = "~/configNix/scripts/weather.sh";
        return-type = "json";
        format = "{}";
        tooltip = true;
        interval = 1200;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "01";
	        "2" = "02";
          "3" = "03";
          "4" = "04";
          "5" = "05";
          "6" = "06";
          "7" = "07";
          "8" = "08";
          "9" = "09";
          "10" = "10";
          "11" = "11";
          "12" = "12";
          "13" = "13";
          "14" = "14";
          "15" = "15";
          "16" = "16";
          "17" = "17";
          "18" = "18";
          "19" = "19";
          "20" = "20";
          "-99" = "-99";
          "active"= "";
          "default"= "";
          "spotify" = "";
          "obsidian" = "󱞁";
          "mail" = "";
          "discord" = "";
              };
        #window-rewrite-default = "?";
        #window-rewrite = {
        #	"class<firefox>" = "󰈹 ";
        #	"class<kitty>" = " ";
        #	"class<Code>" = "󰨞 ";
        #	"class<spotify>" = " ";
        #};
        show-special = true;
        all-outputs = true;
        on-scroll-up = "hyprctl dispatch workspace e-1";
        on-scroll-down = "hyprctl dispatch workspace e+1";
      };

      "hyprland/window" = {
        format = "{title}";
        separate-outputs = true;
        icon = false;
        icon-size = 24;
        rewrite = {
          "(.*) — Mozilla Firefox" = " Firefox - $1";
          "nekonix@nixos(.*)" = "󰄛 Kitty - nekonix@nixos$1";
          "(.*) - Thunar" = "  Thunar - $1";
          "(.*) - Visual Studio Code" = "󰨞 Visual Studio Code - $1";
          "qBittorrent (.*)" = "󰰜 qBittorrent $1";
          "Bottles" = "󰡔 Bottles $1";
        };
      };


      ## Módulos de la derecha
      network = {
          #interface = "eno1";
          #tooltip-format-ethernet = "{ifname} ";
          interval = 1;
          format = "{bandwidthDownBytes}  {bandwidthUpBytes} ";
          format-ethernet = "Ethernet  ";
          format-wifi = "WiFi {icon}{signalStrenght}%";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-disconnected = "Desconectado 󰤮 ";
          format-alt = "{bandwidthDownBytes}  {bandwidthUpBytes} ";
      };

      cpu = {
        format = "{usage}%  ";
        tooltip = true;
      };

      temperature = {
        thermal-zone = 2;
        hwmon-path = [
          "/sys/class/hwmon/hwmon5/temp1_input"
          "/sys/class/hwmon/hwmon3/temp1_input"
          "/sys/class/hwmon/hwmon4/temp1_input"
          "/sys/class/hwmon/hwmon7/temp1_input"
          "/sys/class/thermal/thermal_zone0/temp"
        ];
        critical-threshold = 88;
        format-critical = "{temperatureC}°C   ";
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" "" ""];
	      interval = 1;
      };

      "custom/ventiladores" = {
        format = {};
        exec = "~/configNix/scripts/velocidadVentiladores.sh";
        interval = 1;
        return-type = "json";
      };

      memory = {
        format = "{used:0.1f}G/{total:0.1f}G  ";
        tooltip = false;
        interval = 1;
      };



      pulseaudio = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-muted = "󰖁";
        format-icons = {
          headphone = " ";
          speaker = "󰓃";
          "hands-free" = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" ];
        };
        scroll-step = 1;
        on-click = "pavucontrol";
        max-volume = 100;
      };

      cava = {
        framerate = 144;
        autosens = 1;
        #sensitivity = 100;
        bars = 14;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        sample_rate = 44100;
        sample_bits = 8;
        method = "pulse";
        source = "auto";
        sleep_timer = 10;
        hide_on_silence = true;
        stereo = true;
        reverse = false;
        bar_delimiter = 0;
        monstercat = false;
        waves = false;
        noise_reduction = 0.77;
        input_delay = 0;
        format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        actions = {
          on-right-click = "mode";
        };
       };

      "custom/spotify" = {
        format = {};
        exec = "~/configNix/scripts/currentSongSpotify.sh";
        interval = 2;
        return-type = "json";
        on-click = "playerctl -p spotify play-pause";
      };

      battery = {
        interval = 1;
        states = {
          good = 95;
          warning = 50;
          critical = 20;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% {icon}󱐋";
        format-full = "{capacity}% {icon}󱐋";
        format-critical = "{capacity}% {icon}";
        format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        max-length = 25;
      };
    };
  };
  style = ''

          * {
            border: none;
            border-radius: 0;
            min-height: 0;
            margin: 0;
            padding: 0;
          }
          #waybar {
            /* background: #1e222a; */
            
            background: rgba(27, 31, 50,0);
            color: #eeeeef;
            font-size: 14px;
            font-family: "Hack Nerd Font", "FiraCode Nerd Font", sans-serif;
          }

          #clock,
          #custom-weather,
          #workspaces,
          #window,
          #network,
          #cpu,
          #temperature,
          #custom-ventiladores,
          #memory,                    
          #pulseaudio,
          #cava,
          #custom-spotify,
          #battery
           {
            padding: 4px 8px;
            background-color: rgba(0,0,0,0.8);
            /*background-color: #303643;*/
            border-radius: 30px;
            margin: 4px 2px;
          }

          #clock {
            color: #f4d4a5;
            /* opacity: 0.7; */
            /* font-size: 18px; */
          }

          #custom-weather {
          color: #eec38c;
          }

          #workspaces button {
            color: #ddb176;
	          margin: 0px 2px;
          }
          /* Fix: active workspace doesn't show up */
          /* #workspaces button.focused { */
          #workspaces button.active {
            color: #ddb176;
          }

          window#waybar.empty #window {
          background-color: transparent;
          }

          #window {
            color: #f2cfae;
          }

          #network {
            color: #e6b98c;
            /*min-width: 200px;*/
          }

          #cpu {
            color: #e8c798;
          }

          #temperature {
            color: #e9bd83;
          }

          #custom-ventiladores {
            color: #f7d6b0;
          }

          #memory {
            color: #f1d8b0;
          }          

          #custom-spotify,
          #pulseaudio,
          #cava {
            color: #d7b38a; 
	        } 

          #battery {
          min-width: 56px;
          color: #f5e2c5;
          }
          
	  
          
        '';




};

}
