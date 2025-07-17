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

function starting() {
  echo -ne "\n${yellow}[+]${end}${gray} Enter the${end}${yellow} real domain${end}${gray} (Ex. https://google.com): ${end}${cyan}" && read real
  echo -ne "\n${yellow}[+]${end}${gray} Enter the${end}${yellow} fake domain${end}${gray} (Ex. youtube.com): ${end}${cyan}" && read fake
  echo -ne "\n${yellow}[+]${end}${gray} Enter${end}${yellow} fake tags${end}${gray} (Ex. add-friend, account): ${end}${cyan}" && read tags

  tput civis

  declare -a short_urls
  declare -a cmds=(
    "curl -s 'https://da.gd/s?url=$real'"
    "curl -s 'https://is.gd/create.php?format=simple&url=$real'"
    "curl -s 'https://tinyurl.com/api-create.php?url=$real'"
    "curl -s -X POST -d 'simple=true&url=$real' https://gg.gg"
  )

  for i in "${!cmds[@]}"; do
    eval "${cmds[$i]}" > "/tmp/url_$i" &
  done

  # Espera máxima (fail-safe)
  sleep 1.5

  for i in "${!cmds[@]}"; do
    if [ -s "/tmp/url_$i" ]; then
      url=$(<"/tmp/url_$i")
      [[ "$url" == https://* ]] && short_urls+=("$url")
      rm -f "/tmp/url_$i"
    fi
  done

  if [ ${#short_urls[@]} -eq 0 ]; then
    echo -e "\n\n${red}[!] No URL was masked!${end}\n"
    tput cnorm; exit 1
  fi

  echo -e "\n${blue}[+]${end}${gray} Masked URLs:${end}\n"
  for url in "${short_urls[@]}"; do
    domain_path="${url#https://}"
    masked="https://${fake}-${tags}@${domain_path}"
    echo -e "\t${blue} ${masked}${end}"
  done

  echo -e "\n\n${green}[+] By ne0mesys${end}\n"
  tput cnorm
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

