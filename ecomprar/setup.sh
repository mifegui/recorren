#!/bin/bash

entregasUrl="52.23.206.198:5000"
recorrenUrl="18.234.161.159:5001"

yes | sudo yum install git
yes | sudo yum install python3-pip

sudo rm -r recorren
git clone "https://github.com/mifegui/recorren.git"
cd recorren/ecomprar

pip3 install Flask
sudo pip3 install requests

sed -i 's|^entregasUrl=.*|entregasUrl="'$entregasUrl'"|' ecomprar.py
sed -i 's|^recorrenUrl=.*|recorrenUrl="'$recorrenUrl'"|' ecomprar.py

pkill python
python3 ecomprar.py