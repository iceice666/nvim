#!/usr/bin/env bash

counter=0
speed=20



if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  speed=10
else
  case $(ps -o comm= -p "$PPID") in
    sshd|*/sshd) speed=10;;
  esac
fi

while :
    do
        counter=$((counter+1))
        tput cup 0 0
        lolcat $1 -S $counter -f -s $speed
        #sleep .1
    done
