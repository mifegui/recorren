#!/bin/bash

#ecommerceUrl="184.73.130.93:80"
entregasUrl="34.229.221.143:5000"
recorrenUrl="3.88.158.166:5001"

#ecommerceSsh=ec2-user@${ecommerceUrl}
entregasSsh=ec2-user@${entregasUrl}
recorrenSsh=ec2-user@${recorrenUrl}

#ecommerceSsh=${ecommerceSsh/:*/}
entregasSsh=${entregasSsh/:*/}
recorrenSsh=${recorrenSsh/:*/}

sshKey="vockey.pem"

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' ecommerce/setup.sh
sed -i 's|^recorrenUrl.*|recorrenUrl="'$recorrenUrl'"|g' ecommerce/setup.sh

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' erecorren/setup.sh

#scp -i $sshKey ecommerce/setup.sh ${ecommerceSsh}:
scp -i $sshKey eentregas/setup.sh ${entregasSsh}:
scp -i $sshKey erecorren/setup.sh ${recorrenSsh}:

#ssh -i $sshKey $ecommerceSsh 'bash setup.sh' &
ssh -i $sshKey $entregasSsh 'bash setup.sh' &
ssh -i $sshKey $recorrenSsh 'bash setup.sh' &

cd ecommerce/sereiada
bash ../setup.sh
