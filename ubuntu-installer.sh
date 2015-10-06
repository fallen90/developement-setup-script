#!/bin/bash




#utils
print_status() {
	echo "$1"
}

cleanup(){
	clear
	print_status "Cleaning up before we start"
	rm -rf /var/lib/apt/lists/*
}

update_ubuntu(){
	clear
	print_status "Update Ubuntu"
	apt-get -y update
	apt-get -y update --fix-missing
	apt-get -y upgrade
	apt-get -y dist-upgrade
	apt-get clean
	apt-get autoclean
	apt-get -y autoremove
}

install_lamp(){
	clear
	print_status "Installing LAMP Stack"
	apt-get install apache2
	a2enmod rewrite
	apt-get install libapache2-mod-php5
	service apache2 restart
	apt-get install mysql-server
	apt-get install php5-mysql php5-mcrypt
	apt-get install phpmyadmin
}

install_devtools(){
	clear
	print_status "Install Development Tools"
	apt-get install git build-essentials vim nano
}

install_node(){
	clear
	print_status "Install NodeJS"
}



# must run as admin
if [ "$EUID" -ne 0 ]
  then print_status "Please me run as root"
  exit
fi