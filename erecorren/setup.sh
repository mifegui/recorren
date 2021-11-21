#!/bin/bash

entregasUrl="54.167.36.244:5000"
url="http://"$entregasUrl

yes | sudo yum install git
yes | sudo yum install python3-pip

git clone "https://github.com/mifegui/recorren.git"
cd recorren/erecorren

pip3 install Flask

sed -i 's|^entregasUrl.*|entregasUrl="'$url'"|g' recorra.py

python3 recorra.py