#!/usr/bin/env bash

name_proj=$1
path="YourPath do u want to create your project folder"

if [ -z $1 ]
then
    printf '{"name":"'\'$0'", "private":true}'
    exit 84
else
    cd 
    cd $path
    mkdir $1
    cd $1
    git init
    curl -u YourUsername:YourToken https://api.github.com/user/repos -d '{"name":"'\'$name_proj'", "private":true}'
    echo -e "Successfuly repo created on Github\n"
    git remote add origin https://github.com/YourUsername/-$name_proj.git
    touch initial
    git add initial
    git commit -m "initial commit"
    git push origin master
fi
