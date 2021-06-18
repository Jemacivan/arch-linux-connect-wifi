#!/usr/bin/bash 


question(){
	echo "Enter name wifi adapter"

	read -n 1 -s -r -p "Press any key to continue"
	ifconfig
	read -p ":>" iface
	echo "clear" | bash


	echo "Enter network name(ESSID)"
	read -p ":>" name

	echo "Change type your network!"
	echo "1. No password"
	echo "2. WPA/PSK2 password"
	read -p ":>" type
}


without_password_connect(){
echo 'network={
	ssid="'$name'"
	key_mgmt=NONE
}' > /etc/wpa_supplicant/config.conf
}


with_passoword_connect(){
wpa_passphrase $name $password > /etc/wpa_supplicant/config.conf
}

check_info(){
if [[ $type == 1 ]];
then
echo "
ESSID: $name
Type: No password
"
else
echo "
ESSID: $name
Type: WPA-PSK password
Password: $password
"
fi
read -p "Is that correct? [Y/n]" answ
if [[ $answ == "n" ]] || [[ $answ == "N" ]];
then
	exit 1
fi
}

run_wpa_supplicant(){
	wpa_supplicant -B -i $iface -c /etc/wpa_supplicant/config.conf
}


main(){

	question

	if [[ $type == 1 ]];
	then 
		without_password_connect
	elif [[ $type == 2 ]];
	then
		echo "Enter network password"
		read -p ":>" password
		with_passoword_connect
	else
		echo "Unknown type"
		exit 1
	fi
	check_info
	run_wpa_supplicant
}

main
exit 1
