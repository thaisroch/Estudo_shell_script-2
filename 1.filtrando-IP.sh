#!/bin/bash
#Descricao: O script acessa o arquivo apache-log e busca pelo IP passado por parametro e tras o log.


CAMINHO_LOG=/var/log/apache2
cd $CAMINHO_LOG

REGEX="\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b"

if [[ $1 =~ $REGEX ]] # =~ e comparando se e igual, neste caso usa dois [[]] pois estamos usando comparacao com o regex dentro da condicao.
then
    cat access.log | grep $1  # $1 pega o primeiro passado quando chama o script.
    if [ $? en 0 ] # Validando o status de saida do cat $?, en (Nao e igual - not equals), comparando com 0 pois todos status de comando retorna um valor, o de sucesso e 0.
    then
        echo "IP nao encontrado no arquivo!"
    fi
else
    echo "Formato de IP invalido!"
fi