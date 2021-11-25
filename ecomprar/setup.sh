#!/bin/bash

entregasUrl="100.27.31.241:5000"
recorrenUrl="3.94.107.80:5001"

yes | sudo yum install git
yes | sudo yum install python3-pip

sudo rm -r recorren
git clone "https://github.com/mifegui/recorren.git"
cd recorren/ecomprar

pip3 install Flask
pip3 install requests

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' ecomprar.py
sed -i 's|^entregasUrl.*|entregasUrl="'$recorrenUrl'"|g' ecomprar.py

pkill python
python3 ecomprar.py