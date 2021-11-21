#!/bin/bash

yes | sudo yum install git
yes | sudo yum install python3-pip

git clone "https://github.com/mifegui/recorren.git"
cd recorren/eentregas

pip3 install Flask

python3 flaskServer.py