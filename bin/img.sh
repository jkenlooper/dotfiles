#! /bin/bash

convert -size $1 canvas:gray -draw "gravity Center text 0,0 '$1'" $2
