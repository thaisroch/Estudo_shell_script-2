#!/bin/bash

#Describe: Verificacao de memoria consumida!

MEMORIA_TOTAL=$(free | grep -i mem | awk '{ print $2}')
MEMORIA_CONSUMIDA=$(free | grep -i mem | awk '{ print $3}')
RELACAO_MEMORIA_ATUAL_TOTAL=$(bc <<< "scale=2;$MEMORIA_CONSUMIDA/$MEMORIA_TOTAL*100" | awk -F. '{ print $1 }')

if [ $RELACAO_MEMORIA_ATUAL_TOTAL -gt 50 ]
then 
mail -s "Consumo de memoria acima do limite" rochathais.pm@gmail.com<<dee
O consumo de memoria esta acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }'
)
dee
fi

#O comando free pega os valores em kilobytes. Porem e possivel tornalo mais humano com o comando free -h.