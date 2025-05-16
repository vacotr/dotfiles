#!/bin/bash
print_text() {
  echo -e "\n\e[1;33m$1\e[0m"
}

current_dir() {
  dirname -- "$0"
}

DEVICES=(
  "toybox"
  "travelbox"
  "rpibox"
)

print_text "Select which device to setup."

PS3="Selecting: "
select option in "${DEVICES[@]}"; do
  case $option in
    "toybox")
      print_text "Setting up: $option"
      bash $(current_dir)/post-install.sh $option
      bash $(current_dir)/cinnamon-setup.sh $option
      bash $(current_dir)/gaming-setup.sh $option
      break;;
    "travelbox")
      print_text "Setting up: $option"
      bash $(current_dir)/post-install.sh $option
      bash $(current_dir)/cinnamon-setup.sh $option
      break;;
    "rpibox")
      print_text "Setting up: $option"
      break;;
    *)
      echo "Invalid option. Try again. $REPLY";;
  esac
done
