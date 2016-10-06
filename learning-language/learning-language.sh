#!/bin/bash

# LearningLanguage

# USAGE
# crontab -e
# The message shows up every 5 mintues
# */5 * * * * ~/learning-language.sh WORD TRANSLATE

readonly WORD=$1
readonly TRANSLATE=$2

main() {
  play show.wav &
  DISPLAY=:0.0 notify-send -i ~/en.png LearningLanguage "«$WORD» — $TRANSLATE"
}

main
