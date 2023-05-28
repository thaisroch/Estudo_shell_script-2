#!/bin/bash

#Descricao: Filtrar o status do servidor do apache, validar se o servico esta ativo, caso nao esteja restarta o servico e envia um email de aviso por GMAIL.


STATUS=$(curl --write-out %{http_code} --silent --output /dev/null  http://localhost)
if [ $STATUS -ne 200 ]
then 
mail -s "Problema no servidor" rochathais.pm@gmail.com<<dee
Houve um problema no servidor e os usuários estao sem acesso ao conteudo WEB

Reinicializando o restart do servidor WEB.
dee
    systemctl restart apache2
fi



