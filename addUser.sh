#!/bin/bash

#vérification qu'il ya des arguments
if [ $# -gt 0 ]
then
    # Boucle de création de compte    
    for argument in "$@" 
    do
        #Vérification que l'utilisateur n'éxiste pas
        cat /etc/passwd | grep "$argument" > /dev/null
        if [ $? -eq 0 ]
        then 
            echo "L'utilisateur $argument existe déjà"
        else
            #création de l'utilisateur
            sudo useradd "$argument"
            #controle de la création du nouvelle utilisateur
            if [ $? -eq 0 ]
            then
                #confirmation de la création de l'utilisateur
                echo "L'utilisateur $argument a été crée"
            else
                #message d'erreur si création utilisateur échoué
                echo "Erreur à la création de l'utilisateur $argument"   
            fi
        fi    
    done        
else
    #message si absence d'argument
    echo "Il manque les noms d'utilisateurs en argument"
fi
