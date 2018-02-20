#!/bin/bash

echo "Hello World"
x=$(logname)
echo "Currently logged user and his logname : $x"
echo "Current shell: $SHELL"
echo "Current directory:$HOME"
echo "Computer Architecture details:$(arch)"
echo "Current path: $PATH"
echo "Present working directory: $(pwd)"
echo "No.of users: $(users)"


