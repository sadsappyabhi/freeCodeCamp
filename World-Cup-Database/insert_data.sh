#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

# Two cat while loops to insert teams into team table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Skip title line of CSV
  if [[ $WINNER != "winner" ]]
  then
    #get team id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    
    #if team id not found
    if [[ -z $TEAM_ID ]]
    then
      #set to null
      TEAM_ID=null
    fi
  
    #insert team 
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    #echo what was inserted
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $WINNER
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #skip title line of csv
  if [[ $OPPONENT != "opponent" ]]
  then
    #get team id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")

    #if team id not found
    if [[ -z $TEAM_ID ]]
    then
      #set to null
      TEAM_ID=null
    fi

    #insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    #echo what was inserted
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $OPPONENT
    fi
  fi
done

#Script continues to insert data into games table

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #check/skip first line
  if [[ $YEAR != "year" ]]
  then
    #get team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' ")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")

    #insert team
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  fi
done