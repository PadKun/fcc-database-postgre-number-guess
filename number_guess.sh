#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#read username
echo Enter your username:
read USER_NAME


#check if user exists in users table
USER_EXISTS=$($PSQL "select user_id from users where username ='$USER_NAME'")

#if user doesnot exist then insert into users table
if [[ -z $USER_EXISTS ]]
then
  INSERT_USER_RESULT=$($PSQL "insert into users(username) values('$USER_NAME')")

  USER_EXISTS=$($PSQL "select user_id from users where username ='$USER_NAME'")

  echo Welcome, $USER_NAME! It looks like this is your first time here.
 
else
  #get game details if the user exists
  GET_GAME_DETAILS=$($PSQL "select count(game_id) as no_of_games, min(total_guesses) as bestgame from games where user_id =$USER_EXISTS group by user_id")

  echo "$GET_GAME_DETAILS" | while IFS="|" read GAMES_PLAYED  BEST_GAME
  do
    echo Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  done  
fi

#generate random number
SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))


#echo "secret number is  $SECRET_NUMBER"
#function to check if the number is guessed correct
CORRECT_GUESS(){
  #if a number is guessed
  if [[  $1 ]]
  then
      #check if the argument is number or not
      if [[ ! $1 =~ ^[0-9]+$ ]]
      then
        echo That is not an integer, guess again:
      else
       #if it is a number then check if the secret number is higher than guessed number
        if [[ $1 -lt $SECRET_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
        else
          #if it is a number then check if the secret number is less than guessed number
          if [[ $1 -gt $SECRET_NUMBER ]]
          then
            echo "It's lower than that, guess again:"
          fi
        fi
      fi
 #read the number again
  read GUESS_NUMBER

  fi
}


echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS_NUMBER

NUMBER_OF_GUESSES=1
#read the number again till the guessed number is equal to random number
until [[ $GUESS_NUMBER == $SECRET_NUMBER ]]
do
  CORRECT_GUESS "$GUESS_NUMBER"
  (( NUMBER_OF_GUESSES++ ))
done

#if the guessed number is correct then insert into the games table 
INSERT_GAME_DETAILS=$($PSQL "insert into games (user_id,total_guesses,secret_number) values($USER_EXISTS,$NUMBER_OF_GUESSES,$SECRET_NUMBER)")

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"



