/* 
Escribir en una clase ParcialArboles que contenga UNA ÚNICA variable de instancia de tipo
BinaryTree de valores enteros NO repetidos y el método público con la siguiente firma:

public boolean isLeftTree (int num)

El método devuelve true si el subárbol cuya raíz es “num”, tiene en su subárbol izquierdo una
cantidad mayor estricta de árboles con un único hijo que en su subárbol derecho. Y false en caso
contrario. Consideraciones:

● Si “num” no se encuentra en el árbol, devuelve false.
● Si el árbol con raíz “num” no cuenta con una de sus ramas, considere que en esa rama hay
-1 árboles con único hijo.

Por ejemplo, con un árbol como se muestra en la siguiente imagen:

Si num = 7 devuelve true ya que en su rama izquierda
hay 1 árbol con un único hijo (el árbol con raíz 23) y en
la rama derecha hay 0. (1 > 0) → true

Si num = 2 devuelve false, ya que en su rama izquierda
hay 1 árbol con único hijo (árbol con raíz 23) y en la
rama derecha hay 3 (árboles con raíces -5, 19 y 4). (1 >
3) → false)

Si num = -5 devuelve true, ya que en su rama izquierda
hay 2 árboles con único hijo (árboles con raíces 19 y 4) y
al no tener rama derecha, tiene -1 árboles con un único
hijo. (2 > -1) → true

Si num = 19 debería devolver false, ya que al no tener
rama izquierda tiene -1 árboles con un único hijo y en su
rama derecha hay 1 árbol con único hijo. (-1 > 1) → false

Si num = -3 debería devolver false, ya que al no tener
rama izquierda tiene -1 árboles con un único hijo y lo
mismo sucede con su rama derecha. (-1 > -1 ) → false
 */


package Practica2.Ej7;

import Practica2.Ej1y2.ArbolBinario;

public class ParcialArboles {
	private ArbolBinario<Integer> ab;
	
	public ParcialArboles(ArbolBinario<Integer> ab) {
		this.ab = ab;
	}
	
	public ArbolBinario<Integer> getAb() {
		return ab;
	}
	
	private int contarUnicoHijo(ArbolBinario<Integer> arb) {
		int cant = 0;
		if (arb.hasLeftChild()) cant += contarUnicoHijo(arb.getLeftChild());
		if (arb.hasRightChild()) cant += contarUnicoHijo(arb.getRightChild());
		if ((arb.hasLeftChild() && !arb.hasRightChild()) || (!arb.hasLeftChild() && arb.hasRightChild())) cant++;
		return cant;
	}
	
	private boolean isLeftTree(ArbolBinario<Integer> arb) {
		int ramaIzq = -1;
		int ramaDer = -1;
		if (arb.hasLeftChild()) ramaIzq = contarUnicoHijo(arb.getLeftChild());
		if (arb.hasRightChild()) ramaDer = contarUnicoHijo(arb.getRightChild());
		return ramaIzq > ramaDer;
	}
	
	private ArbolBinario<Integer> buscar(ArbolBinario<Integer> ab, int num) {
		if (ab.getData() == num) return ab;
		ArbolBinario<Integer> res = new ArbolBinario<Integer>();
		if (ab.hasLeftChild()) {
			res = buscar(ab.getLeftChild(), num);
		}
		if ((ab.hasRightChild()) && (res.isEmpty())) {
			res = buscar (ab.getRightChild(), num);
		}
		return res;
	}
	
	public boolean isLeftTree(int num) {
		ArbolBinario<Integer> arb = buscar(ab, num);
		return (!arb.isEmpty()) ? isLeftTree(arb): false;
	}
	
	public static void main(String[] args) {
		System.out.println("Test Ejercicio 7");
		
		ArbolBinario<Integer> ab = new ArbolBinario<Integer>(2);
		ab.addLeftChild(new ArbolBinario<Integer>(7));
		ab.addRightChild(new ArbolBinario<Integer>(-5));
		ab.getLeftChild().addLeftChild(new ArbolBinario<Integer>(23));
		ab.getLeftChild().addRightChild(new ArbolBinario<Integer>(6));
		ab.getLeftChild().getLeftChild().addLeftChild(new ArbolBinario<Integer>(-3));
		ab.getLeftChild().getRightChild().addLeftChild(new ArbolBinario<Integer>(55));
		ab.getLeftChild().getRightChild().addRightChild(new ArbolBinario<Integer>(11));
		ab.getRightChild().addLeftChild(new ArbolBinario<Integer>(19));
		ab.getRightChild().getLeftChild().addRightChild(new ArbolBinario<Integer>(4));
		ab.getRightChild().getLeftChild().getRightChild().addLeftChild(new ArbolBinario<Integer>(18));
		ab.entreNiveles(0, 4);
		
		ParcialArboles parcialArb = new ParcialArboles(ab);
		System.out.println("Resultado=" + parcialArb.isLeftTree(7));
		System.out.println("Resultado=" + parcialArb.isLeftTree(2));
		System.out.println("Resultado=" + parcialArb.isLeftTree(-5));
		System.out.println("Resultado=" + parcialArb.isLeftTree(19));
		System.out.println("Resultado=" + parcialArb.isLeftTree(-3));
	}
}
