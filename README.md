# Recorren

Isto aqui é um repositório que armazena três serviços para montar uma lógica prototipal de serviço de compras recorrentes para uma loja ecommerce.

- ecommerce/ É a pasta em que fica as coisas da loja. Feita em Angular 12 e [ngZorro](https://ng-zorro.gitee.io/)

![Foto da página inicial do ecommerce com quase todos as funcionalidades sendo mostradas](https://i.ibb.co/7rqQy42/super-Print.png)

- eentregas/ É a pasta que simula uma API de processamento de compras e entregas. Feita em Flask e usa uma database da RDS da AWS par armazenar os pedidos

- erecorren/ É a pasta que simula a API de recorrência que de tempos em tempos faz um pedido para a API de eentregas conforme o que o cliente pediu no ecommerce. Também feita em Flask


## Como rodar

Dê um git clone nesse repositório.

É suposto rodar em um ambiente GNU/Linux. Imagino que se você estiver usando o [minGw](https://pt.wikipedia.org/wiki/MinGW) ou o [WSL](https://docs.microsoft.com/pt-br/windows/wsl/about) no Windows também funcione.

A ideia era rodar esses três componentes em três máquinas na AWS. Entretanto, a máquina gratuita da AWS (alguma micro) só tem um giga de RAM e o Angular precisa de mais que isso. Entào, você terá que rodar o ecommerce em seu próprio pc.

Sobre configurar as máquinas, como os componentes já foram programados com práticas de segurança (e práticas de programação no geral...) nada boas por falta de temop e necessidade, você pode só criar duas instâncias na EC2 com acesso total à todas as portas na política de segurança.

Criado as instâncias, coloque o ip público das duas nas variáveis em mainSetup.sh. *Não mude a porta que já está no arquivo*. O script fara substituições em alguns arquivos para os três serviços saberem qual é o ip de quem.

Crie também uma instância de mysql na RDS da amazon. Coloque o endpoint dela no arquivo mainSetup.sh

Coloque sua chave da AWS (e.g. labsuser.pem) na pasta raiz, do lado do mainSetup.sh. Mude o nome dela para `vockey.pem`. Lembre de colocar um nível de acesso razoável para o arquivo (`chmod 600 vockey.pem`) para a AWS não reclamar.

Rode `bash mainSetup.sh`

O script logará nas duas máquinas e instalará as coisas necessárias e logo em seguida iniciará o servidor. Depois tentará iniciar o ecommerce na sua máquina. É pressuposto que você já conseguiu rodar o ecommerce manualmente antes: Vá em ecommerce/sereiada e rode `npm install` e `npm start` depois de já ter o node instalado.

Se de alguma forma conseguir uma máquina com mais RAM, descomente as coisas comentadas em `mainSetup.sh` e em `ecommerce/setup.sh` e delete as últimas duas linhas de `mainSetup.sh`

## O que faz

Quando comprar alguma coisa no ecommerce você pode fazer uma compra única ou recorrente. Se for única, vai direto para a API de entregas. Se for recorrente vai para a API de recorrência que vai mandar para a API de entregas de forma recorrente usando o crontab.

Você pode ver a lista de coisas armazenadas em cada uma das APIs nos links no footer do ecommerce. As API de compra/entrega so armazena os dados num arquivo .json.