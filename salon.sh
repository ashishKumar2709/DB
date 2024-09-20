#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ SALON ~~~~~\n"

SALON_SALON_MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1. What would you like today?"
  else
    echo "Welcome to My Salon. How can I help you?"
  fi
  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services;")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SALON_MAIN_MENU "Please enter a valid option"
    else
       SERVICE_AVAILABILITY=$($PSQL "SELECT name FROM services WHERE service_id= $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_AVAILABILITY ]]
    then
      SALON_MAIN_MENU "I could not find that service"
      else
        echo -e "\nWhat is your phone number?"
       read CUSTOMER_PHONE
       CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone= '$CUSTOMER_PHONE'")
       if [[ -z $CUSTOMER_NAME ]]
       then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
       fi
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone= '$CUSTOMER_PHONE' ")
      SERVICE_NAME_FORMATTED=$(echo $SERVICE_AVAILABILITY | sed 's/^ *//')
      CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed 's/^ *//')
      # ask for the time of service
      echo -e "What time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
      read SERVICE_TIME
      ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
  fi
    fi
}

SALON_MAIN_MENU 