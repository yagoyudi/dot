#!/usr/bin/env bash

RED="\033[31;1m"
RESET_COLOR="\033[0m"
export XDG_CONFIG_HOME="$HOME/.config"

make_nvim() {
	[ ! -x "$(which nvim)" ] && install_nvim
	setup_nvim
}

install_nvim() {
	echo -e "${RED}Installing Neovim${RESET_COLOR}"
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt update
	sudo apt install make gcc ripgrep unzip neovim
}

setup_nvim() {
	echo -e "${RED}Setting up Neovim${RESET_COLOR}"
	ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME/nvim"
}

make_alacritty() {
	[ ! -x "$(which alacritty)" ] && install_alacritty
	setup_alacritty
}

install_alacritty() {
	echo -e "${RED}Installing Alacritty${RESET_COLOR}"
	sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	git clone https://github.com/alacritty/alacritty.git
	cd alacritty
	cargo build --release

	sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
	sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo desktop-file-install extra/linux/Alacritty.desktop
	sudo update-desktop-database

	mkdir -p ~/.bash_completion
	cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
	cd ..
}

setup_alacritty() {
	echo -e "${RED}Setting up Alacritty${RESET_COLOR}"
	mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes
	git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes
	ln -sf "$PWD/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml
}

make_tmux() {
	[ ! -x "$(which tmux)" ] && install_tmux
	setup_tmux
}

install_tmux() {
	echo -e "${RED}Installing Tmux${RESET_COLOR}"
	sudo apt install tmux
}

setup_tmux() {
	echo -e "${RED}Setting up Tmux${RESET_COLOR}"
	ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
}

make_bash() {
	setup_bash
}

setup_bash() {
	echo -e "${RED}Setting up Bash${RESET_COLOR}"
	curl -sS https://starship.rs/install.sh | sh
	ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
	ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
	source $HOME/.bashrc
}

install_my_notes() {
	mkdir -p $HOME/repos
	git clone git@github.com:yagofuruta/notes.git "$HOME/repos"
	mkdir -p $HOME/.local/bin
	ln -sf "$PWD/n" "$HOME/.local/bin/n"
}

# obsidian
#wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.12/obsidian_1.5.12_amd64.deb
#sudo dpkg -i obsidian_1.5.12_amd64.deb

# docker

install_vagrant() {
	wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update && sudo apt install vagrant
}

make_nvim
make_alacritty
make_tmux
make_bash
