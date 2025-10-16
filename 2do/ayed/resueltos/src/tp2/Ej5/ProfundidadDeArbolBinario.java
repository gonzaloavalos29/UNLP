/* Ejercicio 5
Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de
instancia un árbol binario de números enteros y un método de instancia
sumaElementosProfundidad (int p):int el cuál devuelve la suma de todos los nodos del árbol
que se encuentren a la profundidad pasada como argumento */

package tp2.Ej5;

import tp2.Ej1y2.BinaryTree;

public class ProfundidadDeArbolBinario {

	private BinaryTree <Integer> ab;
	
	public ProfundidadDeArbolBinario(BinaryTree<Integer> unArbol) {
		ab = unArbol;
	}
	
	private int sumaElementosProfundidad(int p) {
		return (!ab.isEmpty()) ? sumaElementosProfundidad(p, ab, 0): 0;
	}
	
	private int sumaElementosProfundidad(int p, BinaryTree<Integer> ab, int nivActual) {
		if (p == nivActual) {
			return ab.getData();
		} else {
			int suma = 0;
			if (ab.hasLeftChild()) suma += sumaElementosProfundidad(p, ab.getLeftChild(), nivActual+1);
			if (ab.hasRightChild()) suma += sumaElementosProfundidad(p, ab.getRightChild(), nivActual+1);
			return suma;
		}
	}
	
}
