hostname := `hostname`
user := env('USER')
home := env('HOME')

list:
	@echo "Main tasks available:"
	@echo " - setup-base"
	@echo " - setup-development"
	@echo " - setup-gaming"

setup-base: install-base-packages remove-packages etc-configs cinnamon-settings
	@echo "\n DONE: setup-base \n"
	@sudo apt update -y

setup-development: install-development-packages install-docker install-virt-manager
	@echo "\n DONE: setup-development \n"

setup-gaming: install-steam
	@echo "\n DONE: setup-gaming \n"

install-base-packages:
	@echo "\n Installing base packages \n"
	@xargs -a _bootstrap/base-packages.list sudo apt install -y

install-development-packages:
	@echo "\n Installing development packages \n"
	@xargs -a _bootstrap/development-packages.list sudo apt install -y

install-steam:
	@echo "\n Installing: Steam (deb) \n"
	@sudo dpkg --add-architecture i386
	@sudo apt update
	@wget -O {{home}}/Downloads/steam.deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb -q --show-progress
	@captain {{home}}/Downloads/steam.deb
	@rm {{home}}/Downloads/steam.deb
	@sudo apt install mangohud mangohud:i386 libgamemodeauto0:i386 -y

install-docker:
	@echo "\n Installing: Docker \n"
	@sudo apt install docker.io docker-compose -y
	@sudo usermod -aG docker {{user}}

install-virt-manager:
	@echo "\n Installing: virt-manager \n"
	@sudo apt install virt-manager bridge-utils -y
	@sudo usermod -aG libvirt {{user}}
	@sudo usermod -aG kvm {{user}}
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
	@sudo cp _bootstrap/etc/X11/xorg.conf.d/20-amdgpu.{{hostname}}.conf /etc/X11/xorg.conf.d/20-amdgpu.conf

setup-dots:
	@echo "\n Setting up dots \n"
	@rsync --recursive dots/ {{home}}/