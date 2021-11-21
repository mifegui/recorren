#!/bin/bash

ecommerceUrl="127.0.0.1:4200"
entregasUrl="127.0.0.1:5000"
recorrenUrl="127.0.0.1:5200"

ecommerceSsh=ec2-user@${ecommerceUrl}
entregasSsh=ec2-user@${entregasUrl}
recorrenSsh=ec2-user@${recorrenUrl}

sshKey="vockey.pem"

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' ecommerce/setup.sh
sed -i 's|^recorrenUrl.*|recorrenUrl="'$recorrenUrl'"|g' ecommerce/setup.sh

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' erecorren/setup.sh

scp ecommerce/setup.sh ${ecommerceSsh}:~/
scp eentregas/setup.sh ${entregasSsh}:~/
scp erecorrenUrl/setup.sh ${recorrenSsh}:~/


ssh $ecommerceSsh 'bash setup.sh'
ssh $entregasSsh 'bash setup.sh'
ssh $recorrenSsh 'bash setup.sh'