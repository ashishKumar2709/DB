#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

INPUT=$1
if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else
    if [[ $INPUT =~ [a-zA-Z]+ ]]
    then
        LENGTH=${#INPUT}
        if [[ $LENGTH -le 2 ]]
        then
          ELEMENT=$($PSQL " select elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type from elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number FULL JOIN types ON properties.type_id = types.type_id where symbol='$INPUT';")
        elif [[ $LENGTH -gt 2 ]]
        then
            ELEMENT=$($PSQL " select elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type from elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number FULL JOIN types ON properties.type_id = types.type_id where name='$INPUT';")

        fi
    elif [[ $INPUT =~ ^[0-9]+$ ]]
    then
        ELEMENT=$($PSQL "select elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type from elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number FULL JOIN types ON properties.type_id = types.type_id where elements.atomic_number='$INPUT';")
    fi
    # echo $ELEMENT
    if [[ -z $ELEMENT ]]
    then
        echo "I could not find that element in the database."
    else
        echo "$ELEMENT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
        do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    fi
 fi 