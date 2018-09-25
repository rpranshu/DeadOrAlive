#!/bin/bash
resize -s 17 69
clear
banner(){
tput setaf 172;tput bold;echo $'            -= Built with <3 by PRANSHU RANAKOTI  ©2018 =-';tput sgr0;
tput setaf 1;echo '
·▄▄▄▄  ▄▄▄ . ▄▄▄· ·▄▄▄▄            ▄▄▄       ▄▄▄· ▄▄▌  ▪   ▌ ▐·▄▄▄ .
██▪ ██ ▀▄.▀·▐█ ▀█ ██▪ ██     ▪     ▀▄ █·    ▐█ ▀█ ██•  ██ ▪█·█▌▀▄.▀·
▐█· ▐█▌▐▀▀▪▄▄█▀▀█ ▐█· ▐█▌     ▄█▀▄ ▐▀▀▄     ▄█▀▀█ ██▪  ▐█·▐█▐█•▐▀▀▪▄
██. ██ ▐█▄▄▌▐█ ▪▐▌██. ██     ▐█▌.▐▌▐█•█▌    ▐█ ▪▐▌▐█▌▐▌▐█▌ ███ ▐█▄▄▌
▀▀▀▀▀•  ▀▀▀  ▀  ▀ ▀▀▀▀▀•      ▀█▄▀▪.▀  ▀     ▀  ▀ .▀▀▀ ▀▀▀. ▀   ▀▀▀ '; tput sgr0
tput setaf 172
echo $'\n A simple tool to check whether a particular host is Dead or Alive!\n';tput sgr0
}
banner
tput setaf 1;tput bold;echo -en '**************';
tput setaf 214;tput bold;echo -en 'M';
tput setaf 215;tput bold;echo -en 'E';
tput setaf 216;tput bold;echo -en 'N';
tput setaf 217;tput bold;echo -en 'U';
tput setaf 1;echo '**************';tput setaf 1;tput bold;echo -en '*';
tput setaf 2;  echo -en  ' 1 Manual                     ';tput sgr0;
tput setaf 1;tput bold;echo '*';tput sgr0;tput bold;tput setaf 1;echo -en '*';
tput setaf 6;echo -en    ' 2 Read Hosts from a file ';tput sgr0;
tput setaf 1;tput bold;echo '    *';tput setaf 1;tput bold;echo -en '*';
tput setaf 11;  echo -en ' 9 Reload                   ';tput sgr0;tput setaf 1;tput bold;echo '  *';
tput setaf 1;echo -en '*';tput setaf 9; echo -en ' 0 Exit                     '
tput sgr0;tput setaf 1;tput bold;echo '  *';
tput bold;echo $'********************************';tput sgr0;
read opt
if [[ $opt -eq "1" ]]; then
	clear
	banner
	tput setaf 172;tput bold;echo $'\n                              MANUAL MODE\n';tput sgr0
	echo Enter the host DNS or IP address
	read arg

	ip=$(ping -c 1 $arg | grep -Eo '[0-9.]{9,}' | head -1)

	if [[ $(ping -c 1 $arg) =~ "from" ]]; then
		tput setaf 2; echo "[+] Congrats the host $arg ($ip) is live!"; tput sgr0
	elif [[ $(ping -c 1 -t 4 $arg) =~ "100.0% packet loss" ]]; then
		(echo >/dev/tcp/$arg/80) &>/dev/null && echo "[+] The Host $arg ($ip) is LIVE, but has blocked ICMP reuests" || echo "[-] Bummer.... The host $arg is down"; tput sgr0
	elif [[ $(ping -q -c 1 $arg &> a.txt; cat a.txt) =~ "cannot resolve" ]]; then
		tput setaf 11; echo "[!] No such Hosts found, please input a valid dns or IP address"; rm a.txt; tput sgr0
	fi
	tput blink;tput setaf 1;tput bold;
	echo "Press any key to continue";tput sgr0
	read key
	DOA
elif [[ $opt -eq "2" ]]; then
	clear
	banner
	tput setaf 172;tput bold;echo $'\n                              AUTO MODE\n';tput sgr0
	tput setaf 172;echo 'Enter the absolute path to the host file (1 IP/Host per line)';tput sgr0
	read path
	tput setaf 1;echo 'This may take a while, so please be patient!';tput sgr0;
	input=$path
	while IFS= read -r arg
	do
	ip=$(ping -c 1 $arg | grep -Eo '[0-9.]{9,}' | head -1)

	if [[ $(ping -c 1 $arg) =~ "from" ]]; then
		tput setaf 2; echo "[+] Congrats the host $arg ($ip) is live!"; tput sgr0
	elif [[ $(ping -c 1 -t 1 $arg;) =~ "100.0% packet loss" ]]; then
		(echo >/dev/tcp/$arg/80) &>/dev/null && echo "[+] The Host $arg ($ip) is LIVE, but has blocked ICMP reuests" || echo "[-] Bummer.... The host $arg ($ip) is down"
	elif [[ $(ping -q -c 1 $arg &> a.txt; cat a.txt) =~ "cannot resolve" ]]; then
		tput setaf 11; echo "[!] Host $arg is not valid, please input a valid dns or IP address"; rm a.txt; tput sgr0
	fi
	done < "$input"
	tput blink;tput setaf 1;tput bold;
	echo "Press any key to continue";tput sgr0
	read key
	DOA 
elif [[ $opt -eq "9" ]]; then
		DOA
elif [[ $opt -eq "0" ]]; then
	exit
else
	clear
	echo WRONG CHOICE
	DOA
fi
