#! /bin/bash

# Sort the rules with css-declaration-sorter, apply format fixes with cssfmt

cssfmt $1 && cssdeclsort --order concentric-css $1
