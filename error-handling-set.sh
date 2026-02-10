#!/bin/bash

set -e # this will be checking for errors, if errors it will exit

#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell"
LOGS_FILE="/var/log/shell/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"
 
if [ $USERID -ne 0 ]; then
    echo -e "$R please run this script with root user access $N"  | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

#by default shell will not execute,only executed when called
VALIDATE(){

        if [ $1 -ne 0 ]; then 
            echo -e "$2 ... $R failure $N" | tee -a $LOGS_FILE
            exit 1
        else 
            echo -e "$2 ... $G success $N"  | tee -a $LOGS_FILE
        fi     

}

 for package in $@ #sudo sh.loops-functions.sh nginx mysql nodejs
 do 
    dnf list installed $package &>>$LOGS_FILE 
    if [ $? -ne 0 ]; then
            echo "$package not installed, installing now"
            dnf install $package -y &>>$LOGS_FILE
            #VALIDATE $? "$package installation"
    else
           echo -e "$package already installed ... $Y skipping $N"
     fi              
done
