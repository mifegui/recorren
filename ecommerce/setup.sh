#!/bin/bash

yes | sudo yum install git
yes | sudo yum install npm

git clone https://github.com/mifegui/recorren.git
cd recorren/ecommerce/sereiada

npm install
npm start --port 80