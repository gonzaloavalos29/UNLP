#!/bin/bash
#Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. 
#Esta calculadora debe funcionar recibiendo la operación y los números como parámetros

if [[ $# -ne 3 ]]; then
    echo "Se deben pasar tres números como parámetro"
    exit 1
fi

case $2 in
  "+") echo "$(($1 + $3))";;
  "-") echo "$(($1 - $3))";;
  "*") echo "$(($1 * $3))";;
  "%") 
    if [ "$3" -eq 0 ]; then
      echo "Error: División por cero"
    else
      echo "$(($1 / $3))"
    fi
    ;;
  *) echo "No válido";;
esac

exit 0

# Casos de prueba
# ./ejercicio12_c.sh 20 \* 5 -> 100
# ./ejercicio12_c.sh 10 % 0 -> Error: División por cero