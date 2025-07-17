#!/bin/bash

# Colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n${red}[!] Terminating program...\n"
  tput cnorm; exit 1
}

function helpPanel(){
  echo -e "\n${yellow}[+]${end}${gray} Usage: ${end}"
  echo -e "\n\t${blue}-h${end}${gray}) Shows the help panel.${end}"
  echo -e "\n${gray}-----------------------------------------------------${end}"
  echo -e "\n\t\t  ${yellow}*** WARNING ***${end}"
  echo -e "\n${gray} This tool does NOT perform phishing. It simply masks URL's.${end}"
  echo -e "\n${gray} Please, use this tool with responsibility...${end}"
  echo -e "\n\n${green}[+] By ne0mesys${end}\n"
}

function starting(){
  echo -ne "\n${yellow}[+]${end}${gray} Enter the${end}${yellow} real domain${end}${gray} (Ex. https://google.com): ${end}${cyan}" && read real
  echo -ne "\n${yellow}[+]${end}${gray} Enter the${end}${yellow} fake domain${end}${gray} (Ex. youtube.com): ${end}${cyan}" && read fake
  echo -ne "\n${yellow}[+]${end}${gray} Enter${end}${yellow} fake tags${end}${gray} (Ex. add-friend, account): ${end}${cyan}" && read tags

  tput civis
  short_url=$(curl -s "https://da.gd/s?url=${real}")

  if [[ "$short_url" == https://* ]]; then
    path="https://${fake}-${tags}@${short_url/https:\/\/}"
    tput cnorm 
    echo -e "\n${blue}[+]${end}${gray} URL masked -->${end} ${blue}${path}${end}"
    echo -e "\n\n${green}[+] By ne0mesys\n${end}"
  else
    echo -e "\n\n${red}[!] No URL was masked!${end}\n"
    tput cnorm; exit 1
  fi 
}


# Ctrl + C 
trap ctrl_c INT

#Indicators
declare -i parameter_counter=0

while getopts "h" arg; do 
  case $arg in 
    h) let parameter_counter+=1;;
    \?)
      echo -e "\n\n${red}[!] Invalid option: ${end}${blue}-$OPTARG${end}" # When a parameter that doesn't exist is entered
      exit 1;;
  esac 
done 

if [ "$parameter_counter" -eq 1 ]; then
  helpPanel
else 
  starting
fi 

