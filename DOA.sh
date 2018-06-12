#!/bin/bash
resize -s 11 69
clear
tput setaf 172;tput bold;echo $'            -= Built with <3 by PRANSHU RANAKOTI  ©2018 =-';tput sgr0;
tput setaf 1;echo '
·▄▄▄▄  ▄▄▄ . ▄▄▄· ·▄▄▄▄            ▄▄▄       ▄▄▄· ▄▄▌  ▪   ▌ ▐·▄▄▄ .
██▪ ██ ▀▄.▀·▐█ ▀█ ██▪ ██     ▪     ▀▄ █·    ▐█ ▀█ ██•  ██ ▪█·█▌▀▄.▀·
▐█· ▐█▌▐▀▀▪▄▄█▀▀█ ▐█· ▐█▌     ▄█▀▄ ▐▀▀▄     ▄█▀▀█ ██▪  ▐█·▐█▐█•▐▀▀▪▄
██. ██ ▐█▄▄▌▐█ ▪▐▌██. ██     ▐█▌.▐▌▐█•█▌    ▐█ ▪▐▌▐█▌▐▌▐█▌ ███ ▐█▄▄▌
▀▀▀▀▀•  ▀▀▀  ▀  ▀ ▀▀▀▀▀•      ▀█▄▀▪.▀  ▀     ▀  ▀ .▀▀▀ ▀▀▀. ▀   ▀▀▀ '; tput sgr0

main ()
{
echo $'\n\nEnter\n 1 for Manual \n2 for reading from a file \n9 to reload the script\n0 to exit'
read opt
}
main
if [[ $opt -eq "1" ]]; then
	echo Enter the host DNS or IP address
	read arg

	ip=$(ping -c 1 $arg | grep -Eo '[0-9.]{9,}' | head -1)

	if [[ $(ping -c 1 $arg) =~ "from" ]]; then
		echo Congrats the host '('$ip')' is live!
	else
		echo host '('$ip')' is down
	fi
	main
elif [[ $opt -eq "2" ]]; then
	echo 'Enter the path to the file which has the hosts (Line separated) with extension, eg: /Desktop/ip.txt.'
	read path
	input=$path
	while IFS= read -r var
	do
	ip=$(ping -c 1 $var | grep -Eo '[0-9.]{9,}' | head -1)

	if [[ $(ping -c 1 $var) =~ "from" ]]; then
		tput setaf 2; echo Congrats the host $var '('$ip')' is live!; tput sgr0
	else
		tput setaf 1; echo host $var '('$ip')' is down; tput sgr0
	fi 
	done < "$input"
	main 
elif [[ $opt -eq "9" ]]; then
		DOA
elif [[ $opt -eq "0" ]]; then
	exit
else
	clear
	echo WRONG CHOICE
	DOA
fi
