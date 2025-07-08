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

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
        echo "ERROR: you must have root access"
        exit 1
fi

dnf list installed mysqldnf list installed git
if [ $? -ne 0 ]
then
        dnf install git -y
        VALIDATE $? "git"
else
        echo "GIT already installed"
fi

if [ $? -ne 0 ]
then #not installed.
        dnf install mysql-server -y
        VALIDATE $? "MYSQL"
else
        echo "mysql already installed.."
fi

