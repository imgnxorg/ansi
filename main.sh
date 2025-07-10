#!/bin/zsh
# shellcheck disable=SC1071

echo "ANSI Color Chart (1-255):"
echo ""
columns=8
total=256
squareRoot=$(echo "scale=4; sqrt($total)" | bc -l)
rows=$((total / columns))
cardinal=0
z=0
lastH=-1
lastS=-1
lastL=-1
for ((z = 0; z < 256; z++)); do
	case $z in
	0)
		echo -e "\n"
		echo "Standard Colors"
		;;
	8)
		echo -e "\n"
		echo "Bright Colors"
		columns=8
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
	88)
		echo -e "\n"
		echo "Extended Colors 3"
		columns=6
		cardinal=0
		;;
	124)
		echo -e "\n"
		echo "Extended Colors 4"
		columns=6
		cardinal=0
		;;
	160)
		echo -e "\n"
		echo "Extended Colors 5"
		columns=6
		cardinal=0
		;;
	196)
		echo -e "\n"
		echo "Extended Colors 6"
		columns=6
		cardinal=0
		;;
	232)
		echo -e "\n"
		echo "Grayscale Colors"
		columns=6
		cardinal=0
		;;
	*) ;;
	esac

	if (($cardinal % $columns == 0)); then
		echo -n -e "\n"
	fi

	cardinal=$((cardinal + 1))

	# Calculate RGB values based on ANSI color number
	if [ $z -lt 8 ]; then
		# Standard colors (0-7)
		case $z in
		0)
			r=0
			g=0
			b=0
			;; # Black
		1)
			r=128
			g=0
			b=0
			;; # Dark Red
		2)
			r=0
			g=128
			b=0
			;; # Dark Green
		3)
			r=128
			g=128
			b=0
			;; # Dark Yellow
		4)
			r=0
			g=0
			b=128
			;; # Dark Blue
		5)
			r=128
			g=0
			b=128
			;; # Dark Magenta
		6)
			r=0
			g=128
			b=128
			;; # Dark Cyan
		7)
			r=192
			g=192
			b=192
			;; # Light Gray
		esac
	elif [ $z -lt 16 ]; then
		# Bright colors (8-15)
		case $z in
		8)
			r=128
			g=128
			b=128
			;; # Dark Gray
		9)
			r=255
			g=0
			b=0
			;; # Bright Red
		10)
			r=0
			g=255
			b=0
			;; # Bright Green
		11)
			r=255
			g=255
			b=0
			;; # Bright Yellow
		12)
			r=0
			g=0
			b=255
			;; # Bright Blue
		13)
			r=255
			g=0
			b=255
			;; # Bright Magenta
		14)
			r=0
			g=255
			b=255
			;; # Bright Cyan
		15)
			r=255
			g=255
			b=255
			;; # White
		esac
	elif [ $z -lt 232 ]; then
		# 216 color cube (16-231)
		n=$((z - 16))
		r=$(((n / 36) * 51))
		g=$((((n % 36) / 6) * 51))
		b=$(((n % 6) * 51))
	else
		# Grayscale (232-255)
		gray=$(((z - 232) * 10 + 8))
		r=$gray
		g=$gray
		b=$grayay
	fi

	# Create hex representation
	hex=$(printf "#%02X%02X%02X" $r $g $b)

	# Output color block with hex value on contrasting text
	if [ $((r + g + b)) -gt 384 ]; then
		text_color="30" # Black text for light backgrounds
	else
		text_color="37" # White text for dark backgrounds
	fi

	padded_z=$(printf '%3s' $z)
	echo -en "\033[48;5;${z}m\033[${text_color}m$padded_z\033[49m\033[39m $hex "
done

# for red in {0..255}; do
# 	for green in {0..255}; do
# 		for blue in {0..255}; do
# 			echo -e "\033[38;2;${red};${green};${blue}mColor (${red},${green},${blue})\033[0m"
# 		done
# 	done
# done
