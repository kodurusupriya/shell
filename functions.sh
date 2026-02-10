#!/bin/bash

USERID=$(id -u)
 
if [ $USERID -ne 0 ]; then
    echo "please run this script with root user access"
    exit 1
fi
#by default shell will not execute,only executed when called
VALIDATE(){

if [ $1 -ne 0 ]; then 
    echo "$2 ... failure"
    exit 1
else 
    echo "$2 ... success"   
fi     

}


dnf install nginx -y

VALIDATE $? "nginx installation" 
 

dnf install mysql -y 

VALIDATE $? "mysql installation"   

dnf install nodejs -y

VALIDATE $? "nodejs installation"   