#!/bin/bash
Version="0.1.0"
#assign variables
ACTION=${1}
 

#update all system packages
function update_packages() {
sudo yum update -y
}
function install_git () {
sudo yum install git -y
}


#Create a file called rds-message.txt 

function create_file() {
touch rds-message.txt

#running the command:

nc -vz ecotech-db1.cznnerkufhvt.us-east-1.rds.amazonaws.com 3306

#Create a file called ecoweb1-identity.json

touch ecoweb1-identity.json

#in the present working directory containing the data returned by accessing the URL:

curl -w "\n" http://169.254.169.254/latest/dynamic/instance-identity/document/

}

function Version() {
echo "Version : $Version"
}

#assig h
function display_help() {
cat << EOF 
	Usage: ${0} {-c|--create|-v|--Version|-u|--update|-in|--install|-h|--help} <filename>
	OPTIONS:
-c 	| --create Create file 
-v	| --Version show version
-h      | --help display command help
-u	| --update update packages
-in	| --install install-git
EOF
}

case "$ACTION" in 
	-c|--create)
		create_file
		;;
	-v|--Version)
		Version
		;;
        -u| --update)
                update_packages
                ;;
        -in| --install)
                install_git
                ;;
	-h| --help)
                display_help
                ;;
	*)
	echo "Usage ${0} {-c|-v|-u|-in|-h}"
esac
