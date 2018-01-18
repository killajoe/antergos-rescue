#!/bin/sh
## hardware info from inxi show up in mousepad
##
inxi -Fxxc0 > /home/rescue/hardwareinformation &&
mousepad /home/rescue/hardwareinformation
