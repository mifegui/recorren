#!/bin/bash

entregasUrl="52.23.206.198:5000"
recorrenUrl="18.234.161.159:5001"

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

#yes | npm install
npm start -- --port 8080