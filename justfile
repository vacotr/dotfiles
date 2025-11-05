list:
	@echo "Main tasks available:"
	@echo " - setup-base"
	@echo " - setup-development"
	@echo " - setup-gaming"

setup-base: install-base-packages install-deb-get remove-packages etc-configs cinnamon-settings
	@echo "\n DONE: setup-base \n"

setup-development: install-development-packages install-docker install-virt-manager install-vscodium
	@echo "\n DONE: setup-development \n"

setup-gaming: install-steam install-discord
	@echo "\n DONE: setup-gaming \n"

install-base-packages:
	@echo "\n Installing base packages \n"
	@xargs -a _bootstrap/base-packages.list sudo apt install -y

install-development-packages:
	@echo "\n Installing development packages \n"
	@xargs -a _bootstrap/development-packages.list sudo apt install -y

install-deb-get:
	@echo "\n Installing: deb-get (deb-get) \n"
	@curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

install-steam:
	@echo "\n Installing: Steam (deb) \n"
	@sudo dpkg --add-architecture i386
	@sudo apt update
	@wget -O $$HOME/Downloads/steam.deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb -q --show-progress
	@captain $$HOME/Downloads/steam.deb
	@rm $$HOME/Downloads/steam.deb
	@sudo apt install mangohud mangohud:i386 libgamemodeauto0:i386 -y

install-discord:
	@echo "\n Installing: Discord (deb-get) \n"
	@sudo deb-get install discord -y

install-vscodium:
	@echo "\n Installing: VSCodium (deb-get) \n"
	@sudo deb-get install codium -y

install-docker:
	@echo "\n Installing: Docker \n"
	@sudo apt install docker.io docker-compose -y
	@sudo usermod -aG docker $$USER

install-virt-manager:
	@echo "\n Installing: virt-manager \n"
	@sudo apt install virt-manager bridge-utils -y
	@sudo usermod -aG libvirt $$USER
	@sudo usermod -aG kvm $$USER
	@sudo virsh net-autostart default

remove-packages:
	@echo "\n Removing packages \n"
	@xargs -a _bootstrap/remove-packages.list sudo apt remove -y
	@sudo apt autoremove

cinnamon-settings:
	@echo "\n Setting up Cinnamon desktop \n"
	@dconf load / < _bootstrap/cinnamon-settings.ini

etc-configs:
	@echo "\n Setting up X11 configs \n"
	@sudo cp _bootstrap/etc/X11/xorg.conf.d/20-amdgpu.$$(hostname).conf /etc/X11/xorg.conf.d/20-amdgpu.conf

setup-dots:
	@echo "\n Setting up dots \n"
	@rsync --recursive dots/ $$HOME/