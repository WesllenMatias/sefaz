#!/usr/bin/env bash

# sefaz.sh - Verificar se existe atualização do Dominio
#
# Site:       https://wesllenmatias.com.br
# Autor:      Wesllen Matias
# Manutenção: Wesllen Matias
#
# ------------------------------------------------------------------------ #
# Este programa vai checar os status da página da sefaz e enviar via telegram
#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v3.2 - Versão inicial
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
source ShellBot.sh

#Informando bot que será usado
bot_token='625744069:AAGTXbrysLdWXsapmqhI9SPYpgledYJWPa4'

# Inicializando o bot
ShellBot.init --token "$bot_token"
# ------------------------------- TESTES ----------------------------------------- #
[ ! -x $(which lynx) ] && apt install lynx -y
[ ! -x $(which jq) ] && apt install jq -y



status="$(lynx -source http://www.nfe.fazenda.gov.br/portal/disponibilidade.aspx\?versao\=0.00 | tail -n 150 | head -n 36 | grep imagens/bola_ | \
sed 's/<td>/Status Sefaz: /;s/<\/td>.*src="/ /;s/".*//;s/<img.id=//' | \
sed -e 's,imagens/bola_verde_P.png,✅,g;s,imagens/bola_amarela_P.png,⚠<fe0f>,g;s,imagens/bola_vermelho_P.png,❌,g')"


# loop
while :
do
    # Obtendo atualizações
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30

    # Lista os índices das atualizações.
    for id in $(ShellBot.ListUpdates)
    do
    # Bloco de instruções
    (
        # Verifica se a mensagem é do tipo comando.
        if [[ ${message_entities_type[$id]} == bot_command ]]
        then
            # Remove o sufixo contendo o username do bot e o '@' inclusive, extraindo somente o comando.
            case ${message_text[$id]%%@*} in
                '/sefaz')
                    # Envia mensagem ao remetente.
                    ShellBot.sendMessage --chat_id ${message_chat_id[$id]} \
                                         --text "Olá *${message_from_first_name[$id]}*, abaixo Status NF-E *4.00* :

$status

*Consultado em `date +%d-%m-%Y` as `date +%H:%M:%S` *" \
                                         --parse_mode markdown
           #$status=""
                ;;
            esac
         fi
    ) & # Thread
    done
done
