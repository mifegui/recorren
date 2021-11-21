#!/bin/bash

yes | sudo yum install pip

git clone https://github.com/mifegui/recorren.git
cd recorren/eentregas

pip install Flask

python3 flaskServer.py