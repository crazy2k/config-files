#!/bin/sh

# Script taken from http://wcm1.web.rice.edu/mutt-tips.html

MESSAGE=$(cat)

NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($2)"-"tolower($(NF-1)) $0;}}')

if grep -Fxq "$NEWALIAS" $HOME/.mutt/aliases; then
    :
else
    echo "$NEWALIAS" >> $HOME/.mutt/aliases
fi

echo "${MESSAGE}"
