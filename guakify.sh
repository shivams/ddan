#!/usr/bin/env bash

#guakify.sh
#Developed by Shivam Sharma. 2017.

#This is a simple script to "guakify" any application on your desktop. I use it to "guakify" my gnome-terminal (which I prefer over the Guake terminal). 

#What does "guakify" mean? 
#=========================
#There is a terminal application called "Guake". Its nifty feature is that it can be quickly summoned using <F11> key, and made to go away using the same key. However, I always loved gnome-terminal better than guake as the former looked better integrated. So, I developed this small script for guakifying gnome-terminal. However, I after writing this script, I realized that this could be used to "guakify" any given application. So, now you can "guakify" you browser, your word processor or any given application :)  

#REQUIREMENTS
#============
#This script has these dependencies:
	#* wmctrl
	#* xdotool
	#* awk
	#* xwininfo
	#* zenity

winID=`xwininfo | grep "Window id:" | awk '{print $4}' | xargs printf 0x0%x`
winClass=`wmctrl -lpx | grep $winID | awk '{print $4}'`
#winPID=`wmctrl -lpx | grep $winID | awk '{print $3}'`
winCommand=`wmctrl -lpx | grep $winID | awk '{print $3}' | xargs -I{} ps -q {} -o comm=` #Name of the Command with which window was run from

message="We have found the settings for your window. Kindly check if they are okay.\nIf any of the values is not correct, then supply your own value. Make sure there is no space in the value you supply. \n\n Your window's application/command was found to be: $winCommand \n Your window class was found to be: $winClass \n"

#response=`zenity --forms --title="Create user" --text="$message" --add-entry="Command Name" --add-entry="Window Class"`
#if [[ -n $response ]]; then 
	#echo huzzah;
	#userResponse=($(echo $response | tr '|' ' '))
	#if [[ -n ${userResponse[0]} ]]; then winCommand=${userResponse[0]}; fi;
	#if [[ -n ${userResponse[1]} ]]; then winClass=${userResponse[1]}; fi;
#fi; 

read -p "Command for this window: (default:$winCommand) " userCommand
read -p "Class for this window: (default:$winClass) " userClass

if [[ -n $userCommand ]]; then winCommand=userCommand; fi;
if [[ -n $userClass ]]; then winCommand=userClass; fi;

settingCommand='appCommand="'"$winCommand"'" #Command to run if our application is not running currently'
settingClass='windowClass="'"$winClass"'" #Class of the application window'

echo $settingCommand
echo $settingClass
