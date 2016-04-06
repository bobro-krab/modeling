#!/bin/bash

if [[ $# -le 0 ]]; then
    echo "Using: $0 <tablename>"
    exit
fi

gnuplot << EOP

set terminal png size 800,600
set output "graph.png"
set style data boxes

set xlabel "bla"
set ylabel "blabla"

plot "$1" using :1 title "Ускорение" with lines

EOP
