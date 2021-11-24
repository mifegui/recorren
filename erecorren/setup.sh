#!/bin/bash

entregasUrl="34.238.233.0:5000"
url="http://"$entregasUrl

yes | sudo yum install git
yes | sudo yum install python3-pip

sudo rm -r recorren
git clone "https://github.com/mifegui/recorren.git"
cd recorren/erecorren

pip3 install Flask

sed -i 's|^entregasUrl.*|entregasUrl="'$url'"|g' recorra.py

pkill python
python3 recorra.py