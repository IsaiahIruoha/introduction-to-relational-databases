#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Isaiah's Salon ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "How can I help you today?" 
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read ID BAR NAME
  do
    echo -e "\n$ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SELECT_SERVICE="cut" PROVIDE_SERVICE ;;
    2) SELECT_SERVICE="colour" PROVIDE_SERVICE ;;
    3) SELECT_SERVICE="perm" PROVIDE_SERVICE ;;
    4) SELECT_SERVICE="style" PROVIDE_SERVICE ;;
    5) SELECT_SERVICE="trim" PROVIDE_SERVICE ;;
    *) MAIN_MENU "I could not find that service, please select a valid option." ;;
  esac
}

PROVIDE_SERVICE () {

 # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nSeems like its your first time here, what's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
        fi

        echo What time would you like to have get your $SELECT_SERVICE done $CUSTOMER_NAME?

        read SERVICE_TIME

        # retrieve customer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # insert appointment
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        # reply

        echo "I have put you down for a $SELECT_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."  
}

MAIN_MENU 
