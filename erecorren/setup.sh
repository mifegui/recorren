#!/bin/bash

entregasUrl="https://issoSeraSubstituido.com"

yes | sudo yum install pip

git clone https://github.com/mifegui/recorren.git
cd recorren/erecorren

pip install Flask

sed -i 's|^eentregasUrl.*|entregasUrl="'$entregasUrl'"|g' recorra.py

python3 recorra.py