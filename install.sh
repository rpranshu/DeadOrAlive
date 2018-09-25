#!/bin/bash
sudo mv DOA.sh /usr/local/bin/DOA;chmod +x /usr/local/bin/DOA
echo "Press any key to start the tool";read a;DOA
find . ! -name install.sh -delete
echo "DOA has been added in your local bin, just type in DOA in your terminal to use the tool!" >> DOA.sh
sleep 0.5
echo -en "Starting Dead or Alive"; sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;
DOA