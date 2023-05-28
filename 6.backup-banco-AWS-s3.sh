#!/bin/bash
# Descricao: Criacao de um dump das tabelas de um banco mysql e armazenar no S3 da AWS.

USUARIO=$(whoami)
CAMINHO_BACKUP=/home/$USUARIO/Documentos/Github/Shell-Scritp2/backup_amazon
cd $CAMINHO_BACKUP
DATA=$(date +%F)
if [ ! -d $DATA ]
then
	mkdir $DATA
fi

TABELAS=$(sudo mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for tabela in $TABELAS
do
    sudo mysqldump -u root mutillidae $TABELAS > $CAMINHO_BACKUP/$DATA/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://teste-backup-shell-script


#chmod +x 6.backup-banco-AWS-s3.sh

#Listar a tabela de um banco no mysql sem acessar o mysql.
# sudo mysql -u root mutillidae -e "show tables;"

#A opcao -v faz uma busca invertida, trazendo todas as linhas com excecao da linha passada como argumento.

#sudo crontab -e
#22 10 * * * [caminho completo para o script backup-banco-AWS-s3.sh]

#aws s3 sync $CAMINHO_BACKUP s3://[nome do seu bucket]