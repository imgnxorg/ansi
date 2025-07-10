#!/bin/zsh

echo "ANSI Color Chart (1-255):"
echo "========================="

echo "Squares:"
breakingPoint=8
squareRoot=16

for n in {1..$squareRoot}; do
    for o in {1..$squareRoot}; do
	p=$((n * o))
	padding=$(printf '%*s' $((3 - ${#p})) '')
	print -Pn "%K{$p} █ %k"
	if (( $o % $breakingPoint == 0 )); then
	    echo "[$n]"
	fi
    done
done

echo "Linear"

for n in {1..255}; do
	padding=$(printf '%*s' $((3 - ${#n})) '')
	print -Pn "%K{$((n + 1))}   %k "
	if (( $n % $breakingPoint == 0 )); then
	    echo "$n"
	fi
done
