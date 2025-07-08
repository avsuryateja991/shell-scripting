#!/bin/bash

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
echo "file created"
for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    echo "listed the packages"
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        echo "installed packages"
        echo "$package installed freshly"
    else
        echo " $package already installed"
    fi
done
