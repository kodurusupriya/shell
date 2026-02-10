#!/bin/bash

USERID=$(id -u)
 
if [ $USERID -ne 0 ]; then
    echo "please run this script with root user access"
    exit 1
fi

echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Installing Nginx ... failure"
    exit 1
else 
    echo "Installing Nginx ... success"   
fi     

dnf install mysql -y 

if [ $? -ne 0 ]; then 
    echo "Installing mysql ... failure"
     exit 1
else 
    echo "Installing mysql ... success"   
fi     

dnf install nodejs -y

if [ $? -ne 0 ]; then 
    echo "Installing nodejs ... failure"
    exit 1
else 
    echo "Installing nodejs ... success"   
fi     