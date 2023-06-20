#!/bin/bash
#Descricao: O script acessa o arquivo apache-log e busca pelo IP passado por parametro e tras o log.

# Guardando o path em variavel
CAMINHO_LOG=/var/log/apache2
# Entrando no diretório do path
cd $CAMINHO_LOG
# Usando o regex para validar o parametro que será passado quando executar o script, armazendo na variavel REGEX
REGEX="\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b"
# IF de condição validando se o parametro passado é igual ao regex.
if [[ $1 =~ $REGEX ]] # neste caso usa dois [[]] pois estamos usando comparacao com o regex dentro da condicao.
then
    cat access.log | grep $1  # busca e lista toda requisição do parametro passado dentro do arquivo acess.log 
    if [ $? en 0 ] # Validando o status de saida do cat $?, en (Nao e igual - not equals) a 0, pois todos status de comando retorna um valor, o de sucesso é 0.
    then
        # Dando um retorno ao usuário caso não encontre esse IP
        echo "IP nao encontrado no arquivo!"
    fi
else
    # Dando um retorno ao usuário caso o regex valide que o formato digitado não seja valido.
    echo "Formato de IP invalido!"
fi