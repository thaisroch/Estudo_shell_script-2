#!/bin/bash
# Descricao: Criacao de um dump de um banco mysql.

USUARIO=$(whoami)
CAMINHO_BACKUP=/home/$USUARIO/Documentos/Github/Shell-Scritp2

cd $CAMINHO_BACKUP
if [ ! -d backup ]
then
    mkdir backup
fi

sudo mysqldump -u root $1 > $CAMINHO_BACKUP/backup/$1.sql
if [ $? -eq 0 ] 
then
    echo "Backup foi realizado com sucesso"
else
    echo "Houve um problema no backup"
fi