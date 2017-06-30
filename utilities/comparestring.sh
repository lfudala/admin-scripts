#!/bin/bash
# Ugly string compare

echo "Enter first string "
read test1
echo "Enter second string "
read test2

if [ "$test1" != "$test2" ]; then
     # not equal
  echo "Different"
else
     # equal
  echo "Match"
fi
