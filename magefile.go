//go:build mage

package main

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/carolynvs/magex/pkg"
	"github.com/magefile/mage/sh"
)

var Aliases = map[string]any{
	"n": BuildNixOS,
	"h": BuildHome,
}

var Default = Deploy

func Deploy() error {
	if err := BuildNixOS(); err != nil {
		return err
	}
	if err := Sway(); err != nil {
		return err
	}
	if err := Alacritty(); err != nil {
		return err
	}
	if err := Nvim(); err != nil {
		return err
	}
	return BuildHome()
}

func BuildHome() error {
	user := os.Getenv("USER")
	hostname, err := os.Hostname()
	if err != nil {
		return err
	}
	cmd := exec.Command(
		"home-manager",
		"switch",
		"--flake",
		fmt.Sprintf(".#%s@%s", user, hostname),
	)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func BuildNixOS() error {
	hostname, err := os.Hostname()
	if err != nil {
		return err
	}
	cmd := exec.Command(
		"sudo",
		"nixos-rebuild",
		"switch",
		"--flake",
		fmt.Sprintf(".#%s", hostname),
	)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func Sway() error {
	repoPath := "$HOME/github.com/yagoyudi/dot-remote/.config/sway"
	xdgPath := "$HOME/.config/sway"
	return cleanAndLink(repoPath, xdgPath)
}

func Alacritty() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/alacritty"
	xdgPath := "$HOME/.config/alacritty"
	return cleanAndLink(repoPath, xdgPath)
}

func Nvim() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/nvim"
	xdgPath := "$HOME/.config/nvim"
	return cleanAndLink(repoPath, xdgPath)
}

func Vim() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/vim"
	xdgPath := "$HOME/.config/vim"
	return cleanAndLink(repoPath, xdgPath)
}

func Starship() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/starship.toml"
	xdgPath := "$HOME/.config/starship.toml"
	return cleanAndLink(repoPath, xdgPath)
}

func Git() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/git"
	xdgPath := "$HOME/.config/git"
	return cleanAndLink(repoPath, xdgPath)
}

func Zathura() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/zathura"
	xdgPath := "$HOME/.config/zathura"
	return cleanAndLink(repoPath, xdgPath)
}

func Rofi() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/rofi"
	xdgPath := "$HOME/.config/rofi"
	return cleanAndLink(repoPath, xdgPath)
}

func RofiPass() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.config/rofi-pass"
	xdgPath := "$HOME/.config/rofi"
	return cleanAndLink(repoPath, xdgPath)
}

func GPG() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.gnupg/gpg-agent.conf"
	xdgPath := "$HOME/.gnupg/gpg-agent.conf"
	return cleanAndLink(repoPath, xdgPath)
}

func Bash() error {
	repoPath := "$HOME/github.com/yagoyudi/dot/.bashrc"
	xdgPath := "$HOME/.bashrc"
	if err := cleanAndLink(repoPath, xdgPath); err != nil {
		return err
	}
	repoPath = "$HOME/github.com/yagoyudi/dot/.bash_profile"
	xdgPath = "$HOME/.bash_profile"
	if err := cleanAndLink(repoPath, xdgPath); err != nil {
		return err
	}
	repoPath = "$HOME/github.com/yagoyudi/dot/.inputrc"
	xdgPath = "$HOME/.inputrc"
	return cleanAndLink(repoPath, xdgPath)
}

func cleanAndLink(repoPath, xdgPath string) error {
	err := sh.RunV("rm", "-rf", xdgPath)
	if err != nil {
		return err
	}
	return sh.RunV("ln", "-s", repoPath, xdgPath)
}

func EnsureMage() error {
	return pkg.EnsureMage("")
}
