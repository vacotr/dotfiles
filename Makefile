list-task:
	@echo "Tasks available:"
	@echo " - setup-base"
	@echo " - setup-development"
	@echo " - setup-gaming"

setup-base: install-packages remove-packages install-onlyoffice etc-configs install-fonts cinnamon-settings stow-create
	@echo "\n DONE: setup-base \n"

setup-development: install-docker install-virt-manager install-pulsar-edit install-vscodium
	@echo "\n DONE: setup-development \n"

setup-gaming: install-steam install-discord
	@echo "\n DONE: setup-gaming \n"

install-packages: install-base-packages install-onlyoffice

install-base-packages:
	@echo "\n Installing base packages \n"
	sudo apt update
	xargs -a _bootstrap/add-packages.txt sudo apt install -y

install-onlyoffice:
	@echo "\n Installing: OnlyOffice (extrepo) \n"
	sudo extrepo enable onlyoffice-desktopeditors
	sudo apt update
	sudo apt install onlyoffice-desktopeditors -y

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

install-pulsar-edit:
	@echo "\n Installing: Pulsar Editor (deb) \n"
	bash _bootstrap/scripts/install-pulsar-edit.sh

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

install-discord:
	@echo "\n Installing: Discord (deb) \n"
	bash _bootstrap/scripts/install-discord.sh

remove-packages:
	@echo "\n Removing packages \n"
	xargs -a _bootstrap/remove-packages.txt sudo apt remove -y
	sudo apt autoremove

install-fonts:
	@echo "\n Installing fonts \n"
	sudo mkdir -p /usr/local/share/fonts
	sudo cp -r _bootstrap/fonts/* /usr/local/share/fonts/
	fc-cache -f

cinnamon-settings:
	@echo "\n Setting up Cinnamon desktop \n"
	dconf load / < _bootstrap/cinnamon-settings.txt

etc-configs:
	@echo "\n Setting up X11 configs \n"
	sudo cp _bootstrap/etc/drirc /etc/
	sudo cp _bootstrap/etc/X11/xorg.conf.d/20-amdgpu.$$(hostname).conf /etc/X11/xorg.conf.d/20-amdgpu.conf

stow-create:
	@echo "\n Setting up HOME configs \n"
	stow --target=$$HOME alacritty
	stow --target=$$HOME git
	stow --target=$$HOME onlyoffice

stow-delete:
	@echo "\n Clearing HOME configs \n"
	stow --target=$$HOME --delete alacritty
	stow --target=$$HOME --delete git
	stow --target=$$HOME --delete onlyoffice
