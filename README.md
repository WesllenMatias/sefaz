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
3. Abra o **sefaz.sh** e altere a variavel **bot_token** e adicione o token do seu bot telegram:
```
bot_token='[add aqui o token do seu bot]'
```
4. Acesse a pasta sefaz e dê permissão de execução aos arquivos ShellBot.sh e sefaz.sh:
```
chmod +x sefaz.sh

chmod +x ShellBot.sh
```
5. Para deixar o bot rodando como servico dentro de sua maquina execute os passos abaixo:

### Crie o arquivo sefaz.service dentro de /etc/systemd/system/

```
[Unit]
Description=Sefaz

[Service]
Type=simple
RemainAfterExit=yes
ExecStart=/local/do/sefaz.sh start
ExecStop=/local/do/sefaz/sefaz.sh stop
ExecReload=/local/do/sefaz/sefaz.sh restart

[Install]
WantedBy=multi-user.target
```
6. Execute os comandos abaixo:

```
systemctl daemon-reload
systemctl enable sefaz

```

_OBS: Dentro do Fonte sefaz.sh em **source** coloque o caminho absoluto de onde fica o ShellBot.sh_
