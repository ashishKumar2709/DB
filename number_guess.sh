#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

MAIN_MENU() {
  #Ask for user name
echo -e "\nEnter your username:"
read USERNAME
#check if user exists
USER_NAME_IN_DB=$($PSQL "SELECT name FROM players WHERE name='$USERNAME';")
#if not add user 
if [[ -z $USER_NAME_IN_DB ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USER_RESULT=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME');")
else
  USER_DETAILS=$($PSQL "SELECT COUNT(*) AS games_played, MIN(guess_count) AS best_game FROM players INNER JOIN games ON players.name=games.player WHERE player='$USERNAME' GROUP BY player;")
  echo "$USER_DETAILS" | while read GAMES_PLAYED BAR BEST_GAME
        do
            echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
        done
fi

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
GUESS_COUNT=0
GAME_MENU
}

GAME_MENU() {
  if [[ -z $1 ]]
  then
       echo "Guess the secret number between 1 and 1000:"
  else
      echo $1
  fi
  read GUESSED_NUMBER
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
      GUESS_COUNT=$(($GUESS_COUNT + 1))
      GAME_MENU "That is not an integer, guess again:"
  else
       if [[ $GUESSED_NUMBER -lt $RANDOM_NUMBER ]]
       then
          GUESS_COUNT=$(($GUESS_COUNT + 1))
          GAME_MENU "It's higher than that, guess again:"
      elif [[ $GUESSED_NUMBER -gt $RANDOM_NUMBER ]]
      then
          GUESS_COUNT=$(($GUESS_COUNT + 1))
          GAME_MENU "It's lower than that, guess again:"
      else
          GUESS_COUNT=$(($GUESS_COUNT + 1))
          INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(player, GUESS_COUNT) VALUES('$USERNAME', $GUESS_COUNT);")
          echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
      fi
  fi
}

MAIN_MENU
