#!/bin/bash

rdsUrl="mysqlserver.cbe7tnlfrova.us-east-1.rds.amazonaws.com"

yes | sudo yum install git
yes | sudo yum install python3-pip

git clone "https://github.com/mifegui/recorren.git"
cd recorren/eentregas

sed -i 's|^rds_host = .*|rds_host = "'$rdsUrl'"|g' buyServer.py

pip3 install Flask
pip3 install pymysql

python3 buyServer.py