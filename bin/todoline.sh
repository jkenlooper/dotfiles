# echo a single line from the todo.txt

echo $(sed -n ''"$1"' L' $HOME/.todo/todo.txt)
