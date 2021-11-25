#!/bin/bash

entregasUrl="34.238.233.0:5000"
recorrenUrl="54.237.174.74:5001"

yes | sudo yum install git
yes | sudo yum install python3-pip

sudo rm -r recorren
git clone "https://github.com/mifegui/recorren.git"
cd recorren/ecomprar

pip3 install Flask

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' ecomprar.py
sed -i 's|^entregasUrl.*|entregasUrl="'$recorrenUrl'"|g' ecomprar.py

pkill python
python3 ecomprar.py