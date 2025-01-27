#!/bin/sh
files=(
    .out
    .vs
    .vscode
    **/.vscode
    **.vcxproj
    **/**.vcxproj
    **.vcxproj.**
    **/**.vcxproj.**
    **/Makefile
    Makefile
    **.sln
    **/**.o
    **/**.obj
    **/**.exe
    **/**.out
    **/**.csv
    **.o
    **.obj
    **.exe
    **.out
    **.class
    *.cpp
    *.c
    *.c++
    *.cxx
    *.h
    *.hpp
    *.hxx
    *.py
    *.go
    *.go
    *.java
    src/**
)

for file in "${files[@]}"
do
    rm -rf $file
done