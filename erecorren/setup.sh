#!/bin/bash

entregasUrl="127.0.0.1:5000"
url="http://"$entregasUrl

yes | sudo yum install pip

git clone https://github.com/mifegui/recorren.git
cd recorren/erecorren

pip install Flask

sed -i 's|^eentregasUrl.*|entregasUrl="'$url'"|g' recorra.py

python3 recorra.py