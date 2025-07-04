//7. Uso de las estructuras de listas provistas por la API de Java. Para resolver este punto cree el
//paquete tp1.ejercicio7
//a. Escriba una clase llamada TestArrayList cuyo método main recibe una secuencia de
//números, los agrega a una lista de tipo ArrayList, y luego de haber agregado todos los
//números a la lista, imprime el contenido de la misma iterando sobre cada elemento.
//b. Si en lugar de usar un ArrayList en el inciso anterior hubiera usado un LinkedList ¿Qué
//diferencia encuentra respecto de la implementación? Justifique
//c. ¿Existen otras alternativas para recorrer los elementos de la lista del punto 7a.?
//d. Escriba un método que realice las siguientes acciones:
//■ cree una lista que contenga 3 estudiantes
//■ genere una nueva lista que sea una copia de la lista del inciso i
//■ imprima el contenido de la lista original y el contenido de la nueva lista
//■ modifique algún dato de los estudiantes
//■ vuelva a imprimir el contenido de la lista original y el contenido de la nueva lista.
//¿Qué conclusiones obtiene a partir de lo realizado?
//■ ¿Cuántas formas de copiar una lista existen? ¿Qué diferencias existen entre
//ellas?
//e. A la lista del punto 7d, agregue un nuevo estudiante. Antes de agregar, verifique que el
//estudiante no estaba incluido en la lista.
//f. Escriba un método que devuelva verdadero o falso si la secuencia almacenada en la
//lista es o no capicúa:
//public boolean esCapicua(ArrayList<Integer> lista)
//Ejemplo:
//● El método devuelve verdadero si la secuencia ingresada es: 2 5 2
//● El método devuelve falso si la secuencia ingresada es: 4 5 6 3 4
//g. Considere que se aplica la siguiente función de forma recursiva. A partir de un número
//n positivo se obtiene una sucesión que termina en 1:
//Por ejemplo, para n= 6, se obtiene la siguiente sucesión:
//f(6) = 6/2 = 3
//f(3) = 3*3 + 1 = 10
//f(10) = 10/2 = 5
//….
//Es decir, la sucesión 6, 3, 10, 5, 16, 8, 4, 2, 1. Para cualquier n con el que se arranque
//siempre se llegará al 1.
//■ Escriba un programa recursivo que, a partir de un número n, devuelva una lista
//con cada miembro de la sucesión.
//public class EjercicioSucesion {
//public List<Integer> calcularSucesion (int n) {
////código
//}
//}
//h. Implemente un método recursivo que invierta el orden de los elementos en un ArrayList.
//public void invertirArrayList(ArrayList<Integer> lista)
//i. Implemente un método recursivo que calcule la suma de los elementos en un LinkedList.
//public int sumarLinkedList(LinkedList<Integer> lista)
//j. Implemente el método “combinarOrdenado” que reciba 2 listas de números ordenados y devuelva una nueva lista también ordenada conteniendo los elementos de las 2 listas.
//public ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1,
//ArrayList<Integer> lista2);
package Practica1.Ej7;


