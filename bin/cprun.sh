#!/bin/sh

SH_NAME="cprun.sh"
FILE=$1
GOPT=$2 # enable debug with 2nd param '-g'

if [ -z "$1" ]; then
	echo "Usage: [NAME] [FILE] [OPTION]"
	echo "    [FILE]:   A C++ file name without '.cpp' extention."
	echo "    [OPTION]: Use '-g' for run with debugging. empty for nothing."
	echo ""
	echo "Example: If there is a c++ file called main.cpp"
	echo "    '[NAME] main -g'  # build with debugging info and run"
	echo "    '[NAME] main'     # build with stripping and run"
	exit 1
fi

CXX=g++
DEFINE=AbrarShakhi
COMMON="-Wshadow -Wall -Wextra -Wno-unused-result -std=c++17"

DEBUG="-g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG"
OPTIMIZE="-s -O3"

if [ -z "$2" ]; then
	$CXX -D$DEFINE $COMMON $FILE.cpp -o ./$FILE.out $DEBUG
else
	$CXX -D$DEFINE $OPTIMIZE $COMMON $FILE.cpp -o ./$FILE.out
fi

