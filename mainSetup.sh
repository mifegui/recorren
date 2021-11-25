#!/bin/bash

#ecommerceUrl="184.73.130.93:80"
comprasUrl="3.83.45.245:8080"
entregasUrl="100.27.31.241:5000"
recorrenUrl="3.94.107.80:5001"
rdsUrl="database-1.cl4ej0uksgat.us-east-1.rds.amazonaws.com"

#ecommerceSsh=ec2-user@${ecommerceUrl}
comprasSsh=ec2-user@${comprasUrl}
entregasSsh=ec2-user@${entregasUrl}
recorrenSsh=ec2-user@${recorrenUrl}

#ecommerceSsh=${ecommerceSsh/:*/}
comprasSsh=${comprasSsh/:*/}
entregasSsh=${entregasSsh/:*/}
recorrenSsh=${recorrenSsh/:*/}

sshKey="vockey.pem"

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' ecomprar/setup.sh
sed -i 's|^recorrenUrl.*|recorrenUrl="'$recorrenUrl'"|g' ecomprar/setup.sh

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' ecommerce/setup.sh
sed -i 's|^recorrenUrl.*|recorrenUrl="'$recorrenUrl'"|g' ecommerce/setup.sh

sed -i 's|^entregasUrl.*|entregasUrl="'$entregasUrl'"|g' erecorren/setup.sh

sed -i 's|^rdsUrl.*|rdsUrl="'$rdsUrl'"|g' eentregas/setup.sh

#scp -i $sshKey ecommerce/setup.sh ${ecommerceSsh}:
scp -i $sshKey ecomprar/setup.sh ${comprasSsh}:
scp -i $sshKey eentregas/setup.sh ${entregasSsh}:
scp -i $sshKey erecorren/setup.sh ${recorrenSsh}:

#ssh -i $sshKey $ecommerceSsh 'bash setup.sh' &
ssh -i $sshKey $comprasSsh 'bash setup.sh' &
ssh -i $sshKey $entregasSsh 'bash setup.sh' &
ssh -i $sshKey $recorrenSsh 'bash setup.sh' &

#cd ecommerce/sereiada
#bash ../setup.sh
