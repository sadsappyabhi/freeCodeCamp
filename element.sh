#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."	
fi


if [[ $1 =~ ^[0-9]$ ]]
then
	ELEM_BY_NUM=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number = $1 ")
	echo $ELEM_BY_NUM | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
	do
		echo $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
	done
fi

if [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
then
	echo "symbol"
else
if [[ $1 =~ ^[A-Za-z]+$ ]]
then
	echo "string"
fi
fi
