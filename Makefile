list-task:
	@echo "Tasks available:"
	@echo " - setup-base"
	@echo " - setup-development"
	@echo " - setup-gaming"

setup-base: install-base-packages remove-packages etc-configs cinnamon-settings stow-create
	@echo "\n DONE: setup-base \n"

setup-development: install-development-packages install-docker install-virt-manager install-vscodium
	@echo "\n DONE: setup-development \n"

setup-gaming: install-steam install-discord
	@echo "\n DONE: setup-gaming \n"

install-base-packages:
	@echo "\n Installing base packages \n"
	sudo apt update
	xargs -a _bootstrap/base-packages.txt sudo apt install -y

install-development-packages:
	@echo "\n Installing development packages \n"
	sudo apt update
	xargs -a _bootstrap/development-packages.txt sudo apt install -y

install-docker:
	@echo "\n Installing: Docker CE (extrepo) \n"
	sudo extrepo enable docker-ce
	sudo apt update
	sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
	sudo usermod -aG docker $$USER

install-virt-manager:
	@echo "\n Installing: virt-manager \n"
	sudo apt install virt-manager bridge-utils -y
	sudo usermod -aG libvirt $$USER
	sudo usermod -aG kvm $$USER
	sudo virsh net-autostart default

install-vscodium:
	@echo "\n Installing: VSCodium (extrepo) \n"
	sudo extrepo enable vscodium
	sudo apt update
	sudo apt install codium -y

install-steam:
	@echo "\n Installing: Steam (extrepo) \n"
	sudo dpkg --add-architecture i386
	sudo extrepo enable steam
	sudo apt update
	sudo apt install steam gamescope -y
	sudo extrepo disable steam
	sudo apt update

install-discord:
	@echo "\n Installing: Discord (deb) \n"
	bash _bootstrap/scripts/install-discord.sh

remove-packages:
	@echo "\n Removing packages \n"
	xargs -a _bootstrap/remove-packages.txt sudo apt remove -y
	sudo apt autoremove

cinnamon-settings:
	@echo "\n Setting up Cinnamon desktop \n"
	dconf load / < _bootstrap/cinnamon-settings.ini

etc-configs:
	@echo "\n Setting up X11 configs \n"
	sudo cp _bootstrap/etc/extrepo/config.yaml /etc/extrepo/config.yaml
	sudo cp _bootstrap/etc/drirc /etc/
	sudo cp _bootstrap/etc/X11/xorg.conf.d/20-amdgpu.$$(hostname).conf /etc/X11/xorg.conf.d/20-amdgpu.conf

stow-create:
	@echo "\n Setting up HOME configs \n"
	stow --target=$$HOME alacritty
	stow --target=$$HOME git
	stow --target=$$HOME gtk-3.0

stow-delete:
	@echo "\n Clearing HOME configs \n"
	stow --target=$$HOME --delete alacritty
	stow --target=$$HOME --delete git
	stow --target=$$HOME --delete gtk-3.0
