#!/bin/bash

#root user id exit value is 0, if it has root access, else 1.

VALIDATE(){
        if [ $1 -ne 0 ]
        then
                echo "Installing $2 Failed"
                exit 1
        else
                echo "Installing $2 success"
        fi
}

LOGS_FOLDER="/var/log/"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
        echo "ERROR: you must have root access"
        exit 1
fi

echo "script started eecuting at: $TIMESTAMP" &>>$LOG_FILE_NAME

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
        dnf install git -y &>>$LOG_FILE_NAME
        VALIDATE $? "git"
else
        echo "GIT already installed"
fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then #not installed.
        dnf install mysql-server -y &>>$LOG_FILE_NAME
        VALIDATE $? "MYSQL"
else
        echo "mysql already installed.."
fi