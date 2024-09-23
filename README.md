# Dotfiles

This is the [NixOS](https://nixos.org/) configuration repository for my machines.
Include [Sway WM](https://swaywm.org) and
[Home Manager](https://nix-community.github.io/home-manager/) configuration.

## 💠 File structure

- [home](./home) : Home-manager configuration.
  - [packages](./home/packages) : List of user packages without configuration.
  - [programs](./home/programs) : List of user packages with configuration.
  - [xdg](./home/xdg) : Manage mimeapps and user-dirs.
- [nixos](./nixos) : System configuration.
  - [hardware](./nixos/hardware) : List of hardware configuration.
  - [programs](./nixos/programs) : List of programs installed through the system.
  - [services](./nixos/services) : List of system services.
  - [system](./nixos/system) : List of system settings.
  - [virtual](./nixos/virtual) : Isolation environments and virtual machines.

## 💎 List of apps

| Category          | Name                     |
| :---------------- | :----------------------- |
| Window manager    | `sway`                   |
| Terminal          | `foot`                   |
| Backlight         | `brightnessctl`          |
| Bluetooth         | `blueman`+`bluetoothctl` |
| Browser           | `qutebrowser`            |
| File manager      | `ranger`                 |
| Image viewer      | `imv`                    | 
| Menu              | `dmenu`                  | 
| Notification      | `mako`                   | 
| PDF viewer        | `zathura`                | 
| Screen lock       | `swaylock`               | 
| Screen recorder   | `wf-recorder`            | 
| Shell             | `bash`                   | 
| Terminal session  | `tmux`                   | 
| Text editor       | `vim`                    | 
| Video player      | `mpv`                    | 
| Volume control    | `pulsemixer`             | 

## 🫐 Installation

1. Cloning repository

```sh
git clone https://github.com/yagofuruta/dotfiles.git && cd dotfiles
```

2. Symlink configuration

```sh
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
sudo ln -s $PWD/configuration.nix /etc/nixos/
```

3. Install home manager

Make sure the system and home-manager also use the same version.

| Channel          | Command                                                                                                          |
| :--------------- | :--------------------------------------------------------------------------------------------------------------- |
| 24.11 (unstable) | `sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`        |
| 24.05            | `sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager` |

4. Update channel

```sh
sudo nix-channel --update
```

5. Update version

Replace `stateVersion` variables from [nixos](./nixos/system/default.nix) and
[home](./home/default.nix).

## References

* <https://git.sr.ht/~hervyqa/swayhome>

