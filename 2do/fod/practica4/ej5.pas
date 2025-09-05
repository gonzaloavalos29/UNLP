{ 5. Defina los siguientes conceptos:
● Overflow
● Underflow
● Redistribución 
● Fusión o concatenación
En los dos últimos casos, ¿cuándo se aplica cada uno? }

{
* Overflow: el overflow se produce cuando se quiere agregar una clave a un nodo el cual ya tiene la cantidad máxima de claves permitidas.
* Underflow: El underflow se produce cuando se quiere eliminar una clave de un nodo el cual ya tiene la cantidad mínima de claves permitidas.
* Redistribución: la redistribución sucede cuando un nodo tiene underflow, se puede trasladar una llave de un hermano adyacente a este nodo,
* para que el underflow deje de ocurrir.
* Fusión o concatenación: si un nodo adyacente hermano está al mínimo y no se puede redistribuir, se concatena con un nodo adyacente disminuyendo
* la cantidad de nodos, y en algunos casos la altura del árbol. }
