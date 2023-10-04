#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."	
fi


if [[ $1 =~ ^[0-9]{1,3}$ ]]
then
	NULL=$($PSQL "SELECT COUNT(atomic_number) FROM elements WHERE atomic_number = $1")

	if [[ $NULL -eq 0 ]]
	then
		echo "I could not find that element in the database."
	else
		ELEM_BY_NUM=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1 ")
		echo $ELEM_BY_NUM | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
			do
				echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
			done
	fi
fi

if [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
then
	NULL=$($PSQL "SELECT COUNT(symbol) FROM elements WHERE symbol = '$1'")

	if [[ $NULL -eq 0 ]]
	then
		echo "I could not find that element in the database."
	else
		ELEM_BY_SYM=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
		echo $ELEM_BY_SYM | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
		do
			echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
		done
	fi
else
if [[ $1 =~ ^[A-Za-z]+$ ]]
then
	NULL=$($PSQL "SELECT COUNT(name) FROM elements WHERE name = '$1'")
	if [[ $NULL -eq 0 ]]
	then
		echo "I could not find that element in the database."
	else
		ELEM_BY_NAME=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")
		echo $ELEM_BY_NAME | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
		do
			echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
		done
	fi
fi
fi

