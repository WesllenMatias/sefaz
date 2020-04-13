# sefaz

![nfe-icn](https://user-images.githubusercontent.com/46201054/56322970-d7553e80-6140-11e9-8c80-50ed7f5fc6ff.png)



Repositório para projeto de envio de status sefaz via telegram.

Para rodar o scrip como serviço em seu servidor siga os passos abaixo:

1.  Instale o jq e o lynx:
```
apt-get install jq -y

apt-get install lynx -y
```
2. Clone o repositório:
```
git clone https://github.com/WesllenMatias/sefaz.git
```
3. Abra o sefaz.sh e altere a variavel bot_token e adicione o token do seu bot telegram:
```
bot_token='[add aqui o token do seu bot]'
```
4. Acesse a pasta sefaz e dê permissão de execução aos arquivos ShellBot.sh e sefaz.sh:
```
chmod +x sefaz.sh

chmod +x ShellBot.sh
```
5. Caso queira deixar ele rodando direto na máquina basta executar o comando abaixo:

   **nohup sefaz.sh &&**

_OBS: sefaz.sh e ShellBot.sh devem está no mesmo diretório._
