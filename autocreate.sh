#!/usr/bin/env bash

name_proj=$1
path="YourPATH"
i=0
vertclair='\e[1;32m'
jaune='\e[1;33m'
cyanfonce='\e[0;36m'
cyanclair='\e[1;36m'
rougefonce='\e[0;31m'

progress_bar() {
    echo -ne "${vertclair}#######                 (26%)\r"
    sleep 1
    echo -ne "${vertclair}############            (58%)\r"
    sleep 1
    echo -ne "${vertclair}#################       (82%)\r"
    sleep 1
    echo -ne "${vertclair}####################### (100%)\r"
    echo -ne '\n'
}

progress_bar2() {
    echo -ne "${vertclair}###                     (11%)\r"
    sleep 1
    echo -ne "${vertclair}######                  (27%)\r"
    sleep 1
    echo -ne "${vertclair}##########              (46%)\r"
    sleep 1
    echo -ne "${vertclair}##############          (64%)\r"
    sleep 1
    echo -ne "${vertclair}##################      (89%)\r"
    sleep 1
    echo -ne "${vertclair}####################### (100%)\r"
    echo -ne '\n'
}

if [ -z $1 ]
then
    printf "${rougefonce}Try with only 1 argument pls !\n"
    exit 84
else
    cd 
    cd $path
    mkdir $1
    echo -e "${jaune}Directory named $name_proj is successfully created\n"
    sleep 2
    echo -e "${jaune}Navigate to this directory\n"
    cd $1
    sleep 2
    echo -e "\e[1m${jaune}Initialized git:\e[0m"
    progress_bar
    echo -e "${jaune}\n"
    git init
    sleep 2
    echo -ne "\n"
    curl -u YourUSERNAME:YourTOKEN https://api.github.com/user/repos -d '{"name":"'\'$name_proj'", "private":true}'
    echo -e "${jaune}The repo named ${name_proj} has been successfully created on Github\n"
    sleep 2
    echo -e "${jaune}Directory linked to your repo\n"
    git remote add origin https://github.com/YourUSERNAME/-$name_proj.git
    sleep 2
    touch initial
    echo -e "${jaune}Creation of the initial file to push\n"
    sleep 2
    git add initial
    echo -e "${jaune}Adding to git initial file\n"
    sleep 2
    echo -e "${jaune}Commiting: "
    progress_bar
    echo -ne "${jaune}\n"
    git commit -m "initial commit"
    sleep 2
    echo -e "${jaune}\nPushing initial file to your github repository: "
    progress_bar2
    echo -ne "${jaune}\n"
    git push origin master
    sleep 3
    echo -e "${jaune}\nEverything is done, beatiful\n\n"
    echo -e "\e[3m\e[1mCreated by Sitrixx\e[0m\n"
fi