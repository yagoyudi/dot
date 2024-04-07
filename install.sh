#!/usr/bin/env bash

# create directories
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes
mkdir -p "$XDG_CONFIG_HOME"/neovim

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip neovim
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME/nvim"

# alacritty
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
git clone https://github.com/alacritty/alacritty.git && cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
echo "source $(pwd)/extra/completions/alacritty.bash" >>~/.bashrc
git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes
ln -sf "$PWD/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml

# tmux
sudo apt install tmux
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"

# bash
curl -sS https://starship.rs/install.sh | sh
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc

# my notes
mkdir -p $HOME/repos
git clone git@github.com:yagofuruta/notes.git "$HOME/repos"
ln -sf "$PWD/n" "$HOME/.local/bin/n"

# obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.12/obsidian_1.5.12_amd64.deb
sudo dpkg -i obsidian_1.5.12_amd64.deb

# docker

# vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
