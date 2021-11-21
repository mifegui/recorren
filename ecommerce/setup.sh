#!/bin/bash

entregasUrl="54.167.36.244:5000"
recorrenUrl="3.91.214.185:5001"

#yes | sudo yum install git


#sudo wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
#cd /usr/local
#sudo tar --strip-components 1 -xf ~/node-v16.13.0-linux-x64.tar.xz
#
#
#cd
#git clone "https://github.com/mifegui/recorren.git"
#cd recorren/ecommerce/sereiada

sed -i 's|.*eentregasUrl:.*|  eentregasUrl: "'$entregasUrl'",|g' src/environments/environment.prod.ts
sed -i 's|.*eentregasUrl:.*|  eentregasUrl: "'$entregasUrl'",|g' src/environments/environment.ts
sed -i 's|.*erecorrenUrl:.*|  erecorrenUrl: "'$recorrenUrl'",|g' src/environments/environment.ts
sed -i 's|.*erecorrenUrl:.*|  erecorrenUrl: "'$recorrenUrl'",|g' src/environments/environment.prod.ts

export NODE_OPTIONS="--max-old-space-size=8192"

#yes | npm install
npm start -- --port 8080