/* Ejercicio 5
Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de
instancia un árbol binario de números enteros y un método de instancia
sumaElementosProfundidad (int p):int el cuál devuelve la suma de todos los nodos del árbol
que se encuentren a la profundidad pasada como argumento */

package Practica2.Ej5;

import Practica2.Ej1y2.ArbolBinario;

public class ProfundidadDeArbolBinario {
	
	private ArbolBinario<Integer> ab;
	
	public ProfundidadDeArbolBinario(ArbolBinario<Integer> unArbol) {
		ab = unArbol;
	}
	
	public int sumaElementosProfundidad(int p) {
		return (!ab.isEmpty()) ? sumaElementosProfundidad(p, ab, 0): 0;
	}
	
	private int sumaElementosProfundidad(int p, ArbolBinario<Integer> ab, int nivActual) {
		if (p == nivActual) {
			return ab.getData();
		} else {
			int suma = 0;
			if (ab.hasLeftChild()) suma += sumaElementosProfundidad(p, ab.getLeftChild(), nivActual+1);
			if (ab.hasRightChild()) suma += sumaElementosProfundidad(p, ab.getRightChild(), nivActual+1);
			return suma;
		}
	}
	
	public static void main(String[] args) {
		System.out.println("Test profundidad");
		ArbolBinario<Integer> ab = new ArbolBinario<Integer>(4);
		ab.addLeftChild(new ArbolBinario<Integer>(2));
		ab.addRightChild(new ArbolBinario<Integer>(6));
		ab.getLeftChild().addLeftChild(new ArbolBinario<Integer>(1));
		ab.getLeftChild().addRightChild(new ArbolBinario<Integer>(3));
		ab.getRightChild().addLeftChild(new ArbolBinario<Integer>(5));
		ab.getRightChild().addRightChild(new ArbolBinario<Integer>(8));
		
		ProfundidadDeArbolBinario prof = new ProfundidadDeArbolBinario(ab);
		
		System.out.println(prof.sumaElementosProfundidad(2));
	}
	
}
