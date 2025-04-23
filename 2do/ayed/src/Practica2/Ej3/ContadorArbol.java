/* Ejercicio 3
Defina una clase Java denominada ContadorArbol cuya función principal es proveer métodos de
validación sobre árboles binarios de enteros. Para ello la clase tiene como variable de instancia un
BinaryTree<Integer>. Implemente en dicha clase un método denominado numerosPares() que
devuelve en una estructura adecuada (sin ningún criterio de orden) todos los elementos pares del
árbol (divisibles por 2).
a) Implemente el método realizando un recorrido InOrden.
b) Implemente el método realizando un recorrido PostOrden. */

package Practica2.Ej3;
import Practica1.Ej8.Queue;

import java.util.*;

import Practica1.Ej8.Queue;
import Practica2.Ej1y2.ArbolBinario;

public class ContadorArbol {
	
	private ArbolBinario<Integer> a;
	
	public ContadorArbol(ArbolBinario<Integer> unArbol) {
		a = unArbol;
	}
	
	private void nParesPRE(List<Integer> l, ArbolBinario<Integer> a) {
		if (a.getData()%2 == 0) l.add(a.getData());
		if (a.hasLeftChild()) nParesPRE(l, a.getLeftChild());
		if (a.hasRightChild()) nParesPRE(l, a.getRightChild());
	}
	
	public List<Integer> numerosParesPre() {
		List<Integer> l = new LinkedList<Integer>();
		if (!a.isEmpty()) this.nParesPRE(l, a);
		return l;
	}
	
	private void nParesIN(List<Integer> l, ArbolBinario<Integer> a) {
		if (a.hasLeftChild()) nParesIN(l, a.getLeftChild());
		if (a.getData() % 2 == 0) l.add((a.getData()));
		if (a.hasRightChild()) nParesIN(l, a.getRightChild());
	}
	
	private void nParesPOST(List <Integer> l, ArbolBinario<Integer> a) {
		if (a.hasLeftChild()) nParesPOST(l, a.getLeftChild());
		if (a.hasRightChild()) nParesPOST(l, a.getRightChild());
		if (a.getData() % 2 == 0) l.add(a.getData());
	}
	
	public List<Integer> numerosParesPost() {
		List<Integer> l = new LinkedList<Integer>();
		if (!a.isEmpty()) this.nParesPOST(l, a);
		return l;
	}
	
	public void printLevelTraversal() {
		ArbolBinario<Integer> ab = null;
		Queue<ArbolBinario<Integer>> cola = new Queue<ArbolBinario<Integer>>();
		cola.enqueue(a);
		cola.enqueue(null);
		while (!cola.isEmpty()) {
			ab = cola.dequeue();
			if (ab != null) {
				System.out.println(ab.getData() + " | ");
				if (ab.hasLeftChild()) {
					cola.enqueue(ab.getLeftChild());
				}
				if (ab.hasRightChild()) {
					cola.enqueue(ab.getRightChild());
				}
			} else if (!cola.isEmpty()) {
				System.out.println();
				cola.enqueue(null);
			}
		}
	}
}
