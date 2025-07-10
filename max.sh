#!/bin/zsh
# shellcheck disable=SC1071

z=0

for red in {0..255}; do
    for green in {0..255}; do
        for blue in {0..255}; do
        z=$((z + 1))
        padded_z=$(printf "%04d" $z)
        hex=$(printf "%02x%02x%02x" $red $green $blue)
        text_color=$(printf "%d;%d;%d" $red $green $blue)
        echo -n -e "\033[48;5;${z}m\033[${text_color}m$padded_z\033[49m\033[0m"
        echo -n -e "\033[38;5;${z}m:$hex \033[0m"
        echo -n -e "\033[38;2;${red};${green};${blue}mColor (${red},${green},${blue})\033[0m"
        echo -n -e "\033[48;2;${red};${green};${blue}m\033[0m"
        echo -n -e "\033[38;2;${red};${green};${blue}m\033[0m"
        echo -n -e "\033[38;5;${z}m\033[0m"
        echo -n -e "\033[48;5;${z}m\033[0m"
        done
    done
done
case $z in
    0)
        echo -e "\n"
        echo "Standard Colors"
        ;;
    8)
        echo -e "\n"
        echo "Bright Colors"
        columns=8
        cardinal=0
        ;;
    16)
        echo -e "\n"
        echo "Extended Colors 1"
        columns=6
        cardinal=0
        ;;
    52)
        echo -e "\n"
        echo "Extended Colors 2"
        columns=6
        cardinal=0
        ;;
