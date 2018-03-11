#!/bin/bash

clear
echo "Calculator"
temp=0
i="y"

echo "Enter first no:"
read n1
echo "Enter second no:"
read n2

while [ $i = "y" ]
do
echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Division"
echo "Enter your choice:"
read ch
case $ch in
  1)temp=$(expr $n1 + $n2)
    echo "Sum="$temp;;
  2)temp=$(expr $n1 - $n2)
    echo "Sub="$temp;;
  3)temp=$(expr $n1 \* $n2)
    echo "Product="$temp;;
  4)temp=$(expr $n1 / $n2)
    echo "Quotient="$temp;;
  *)echo "Invalid choice";;
esac
echo "Do u want to continue?"
read i
if [ $i != "y" ]
then
  exit
fi
done
