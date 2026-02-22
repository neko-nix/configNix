# ❄️ ConfigNix

![NixOS](https://img.shields.io/badge/NixOS-blue?logo=nixos&logoColor=white&color=5277C3)
![Version](https://img.shields.io/badge/version-1.0-brightgreen)
[![License: GPL v3](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Last Commit](https://img.shields.io/github/last-commit/neko-nix/repo-plantilla)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/neko-nix/repo-plantilla)
![GitHub issues](https://img.shields.io/github/issues/neko-nix/repo-plantilla?color=informational)

Este repositorio contiene la configuración utilizada por neko-nix en su sistema de NixOS.

## ✅ Funciones actuales:
- [x] Home Manager
- [x] Ambiente de escritorio:
    - [x] Hyprland
    - [x] Waybar
- [x] Searxng
- [x] Adguard Home
- [x] Unbound
## 🛠️ Funciones en progreso:
- [ ] Configuración declarativa de Nvim.
## ⏳ Funciones planeadas:
- [ ] Tailscale
- [ ] Cambiar color scheme del ambiente de escritorio automáticamente según el fondo de pantall

## 🧾 Changelog
La lista completa de cambios se encuentra en [CHANGELOG](CHANGELOG.md).

## ❄️ Entorno en Nix
Para activar el entorno de desarrollo, se requiere tener Nix instalado con soporte para Flakes. Dentro del directorio del proyecto, ejecturar el siguiente comando:"
```sh
nix develop
```

## 🌳 Estructura del proyecto:
```text
├── glava           # Configuración de Glava
├── nixos           # Configuración de Nixos
│   ├── dotFiles    # Configuración de dotfiles con Home Manager
├── scripts         # Scripts varios
├── flake.nix
```

## ⚖️ Licencia
Este proyecto está bajo la licencia GNU GENERAL PUBLIC LICENSE V3. Consulta el archivo [LICENSE](LICENSE) para más detalles.