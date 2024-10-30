#!/bin/sh

SH_NAME="cprun.sh"

function throw_err {
	echo "Usage: [NAME] [FILE] [OPTION]"
	echo "    [FILE]:   A C++ file name without '.cpp' extention."
	echo "    [OPTION]: Use '-g' for run with debugging. empty for nothing."
	echo ""
	echo "Example: If there is a c++ file called main.cpp"
	echo "    '[NAME] main -g'  # build with debugging info and run"
	echo "    '[NAME] main'     # build with stripping and run"
	exit 1
}

if [ "$#" -eq 0 ]; then
	throw_err
fi

FILE=$1

if [[ "${FILE:0:1}" == "-" ]]; then
    echo "filename can not start with a [-]hyphen."
	echo ""
    throw_err
fi


if [[ $2 ]]; then
	if [[ $2 != -* ]]; then
		throw_err
	fi

	for ((i = 1; i < ${#2}; i++)); do
		case "${2:i:1}" in
			'd') dbg="true"
			;; 'r') run='true'
			;; 'i') in='true'
			;; 'o') out='true'
			;; *) throw_err
			;;
		esac
	done

fi



CXX=g++
DEFINE=AbrarShakhi
COMMON="-Wshadow -Wall -Wextra -Wno-unused-result -std=c++17"

DBG_FLAG="-g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG"
OPTIMIZE_FLAG="-s -O3"

if [ -n "$dbg" ]; then
	$CXX -D$DEFINE $COMMON $FILE.cpp -o ./x$FILE.out $DBG_FLAG
    status=$?
else
	$CXX -D$DEFINE $OPTIMIZE_FLAG $COMMON $FILE.cpp -o ./x$FILE.out
    status=$?
fi

if [ $status -ne 0 ]; then
    exit $status
fi

if [[ -z "$run" ]]; then
	exit $status
fi

if [ -n "$in" ] && [ -n "$out" ] && [ -n "$CP_IF" ] && [ -n "$CP_OF" ]; then
    ./x$FILE.out < $CP_IF > $CP_OF
elif [ -n "$in" ] && [ -n "$CP_IF" ]; then
    ./x$FILE.out < $CP_IF
elif [ -n "$out" ] && [ -n "$CP_OF" ]; then
    ./x$FILE.out > $CP_OF
else
    ./x$FILE.out
fi

