### Brief information

This script exclusively generates the config and connects to the WI FI point using wpa_supplicant. 
This script will NOT help you install the driver on your WIFI adapter in ANY way! 
Also it does NOT start the dhcp service and other services. 
Enjoy your use

### Get script
```
curl -sSfLO https://raw.githubusercontent.com/Jemacivan/arch-linux-connect-wifi/master/base.sh
```
### Usage
1. Transfer the file to the file system in any convenient way
2. ``` chmod +x base.sh ```
3. ``` sudo ./base.sh ```
4. Follow Setup Wizard
5. Check your internet connection ``` ping 1.1.1.1 -c 4 ```
6. Enjoy your use

### Troubleshooting
1. Enable the dhcpcd service ``` sudo systemctl start dhcpcd ```
2. Check your wifi adapter and the presence of drivers in the system
3. "Up your adapter" ``` ip link set INTERFACE up ```
