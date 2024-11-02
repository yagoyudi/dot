//go:build mage

package main

import (
	"fmt"
	"os"
	"os/exec"
)

var Aliases = map[string]any{
	"n": BuildNixOS,
	"h": BuildHome,
}

var Default = Both

func Both() error {
	err := BuildNixOS()
	if err != nil {
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
