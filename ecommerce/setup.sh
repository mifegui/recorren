#!/bin/bash

entregasUrl="http://issoSeraSubstituido.com"
recorrenUrl="http://Tambemserasubstituido.xyz"

yes | sudo yum install git
yes | sudo yum install npm

git clone https://github.com/mifegui/recorren.git
cd recorren/ecommerce/sereiada

sed -i 's|.*eentregasUrl:.*|  eentregasUrl: "'$entregasUrl'"|g' src/environments/environment.prod.ts
sed -i 's|.*eentregasUrl:.*|  eentregasUrl: "'$entregasUrl'"|g' src/environments/environment.ts
sed -i 's|.*erecorrenUrl:.*|  erecorrenUrl: "'$recorrenUrl'"|g' src/environments/environment.ts
sed -i 's|.*erecorrenUrl:.*|  erecorrenUrl: "'$recorrenUrl'"|g' src/environments/environment.prod.ts

npm install
npm start --port 80