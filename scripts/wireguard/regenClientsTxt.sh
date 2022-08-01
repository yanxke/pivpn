#!/bin/bash

cd /etc/wireguard/configs || exit

rm clients.txt
for FILENAME in $(ls -1 *.conf); do
    CLIENTNAME=${FILENAME::-5}
    CLIENTKEY=`grep PrivateKey $FILENAME | cut -c14-`
    TIMESTAMP=`date +%s`
    ADDRESS=`grep Address $FILENAME | cut -c18-`
    ADDRESS=${ADDRESS::-3}
    echo $CLIENTNAME $CLIENTKEY $TIMESTAMP $ADDRESS >> clients.txt
done