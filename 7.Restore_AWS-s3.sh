#!/bin/bash
#Descricao: Restore de um backup de uma tabela no armazenada no s3 para o banco mysql local.
USUARIO=$(whoami)
CAMINHO_BACKUP=/home/$USUARIO/Documentos/Github/Shell-Scritp2/restore_amazon
aws s3 sync s3://teste-backup-shell-script/$(date +%F) $CAMINHO_RESTORE

cd $CAMINHO_RESTORE
if [ -f $1.sql ]
then
	sudo mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "O restore foi realizado com sucesso"
	fi
else
	echo "O arquivo procurado nao existe no diretorio"
fi

# Deletar uma tabela para validar o script

#aws s3 sync s3://[ BUCKET-S3]/$(date +%F) $CAMINHO_RESTORE