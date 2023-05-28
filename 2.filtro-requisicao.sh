#!/bin/bash
#Descricao: Filtrar a requisicao dentro do arquivo de log do apache, a requisicao e passada por parametro (GET, PUT,POST, DELETE).


CAMINHO_LOG=/var/log/apache2
cd $CAMINHO_LOG

if [ -z $1 ] # Valida se existe algum parametro passado 
then
    while [ -z $requisicao ] ## Entra no loop enquanto a variavel requisicao for diferente de vazia
    do
        read -p "Voce esqueceu de passar um parametro (GET, PUT,POST, DELETE):" requisicao # read -p e  , e armazena na variavel requisicao o parametro informado pelo usuario.
        PARAM_MAIUSCULO=$(echo $requisicao | awk '{print toupper($1)}') # Faz a conversao do conteudo de requisicao para maiusculo
    done 
else 
    PARAM_MAIUSCULO=$(echo $1 | awk '{print toupper($1)}') # Faz a conversao do conteudo de $1 para maiusculo
fi
case $PARAM_MAIUSCULO in  # faz comparacao com o conteudo da variavel e executa o cat conforme cada condicao.
    GET)
        cat $CAMINHO_LOG/access.log | grep GET
        ;;
    PUT)
        cat $CAMINHO_LOG/access.log | grep PUT
        ;;
    POST)
        cat $CAMINHO_LOG/access.log | grep POST
        ;;
    DELETE)
        cat $CAMINHO_LOG/access.log | grep DELETE
        ;;
    *) # E usado para falar qualquer outro valor diferente dos que ja foram validados anteriormente
        echo "O parametro informado nao e valido!"
        ;;
esac

## Observacao -eq em vez de =~, e utilizada para comparar valores inteiros e nao strings.