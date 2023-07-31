#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=numberguess -t --no-align -c"

#generate random number
SECRET=$(( $RANDOM % 1000 + 1 )); 

#prompt for username
echo -e "Enter your username:" 
read USERNAME; 

#Does username pass requirements? 
while [[ ${#USERNAME} -gt 22 ]] 
do
  echo -e "Your username must be 22 characters or less"
  echo -e "Enter your username:"
  read USERNAME; 
done

#Check if username is within database
USERNAME_EXIST=$($PSQL "SELECT username FROM playerbase WHERE username='$USERNAME'")

#if not add to database
if [[ -z $USERNAME_EXIST ]] 
then
INSERT_USERNAME=$($PSQL "INSERT INTO playerbase(username) VALUES('$USERNAME')") 
echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
#if username recognized then 
GAMES_PLAYED=$($PSQL "SELECT games_played FROM playerbase WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT number_of_guesses FROM playerbase WHERE username='$USERNAME'")
echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"
read GUESS
#track guesses
NUMGUESS=0
let NUMGUESS=NUMGUESS+1

#keep running until the right guess is made
while [[ $GUESS -ne $SECRET ]] 
do 
  if [[ $GUESS =~ ^-?[0-9]+$  && $GUESS -gt $SECRET ]]
  then
    echo -e "It's lower than that, guess again:"
    read GUESS
  elif [[ $GUESS =~ ^-?[0-9]+$  && $GUESS -lt $SECRET ]]
  then 
    echo -e "It's higher than that, guess again:"
    read GUESS
  else
    echo -e "That is not an integer, guess again:"
    read GUESS
  fi 
  let NUMGUESS=NUMGUESS+1
done

if [[ -z $BEST_GAME ]]
then
NEW_USER_RESULT=$($PSQL "UPDATE playerbase SET games_played = games_played + 1, number_of_guesses = $NUMGUESS WHERE username = '$USERNAME'")
else
RETURNING_USER_RESULT=$($PSQL "UPDATE playerbase SET games_played = games_played + 1, number_of_guesses = LEAST($BEST_GAME, $NUMGUESS) WHERE username = '$USERNAME'")
fi
echo -e "You guessed it in $NUMGUESS tries. The secret number was $SECRET. Nice job!"
