/*
Ejercicio 8
Escribir en una clase ParcialArboles el método público con la siguiente firma:
public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2)
El método devuelve true si arbol1 es prefijo de arbol2, false en caso contrario.
Se dice que un árbol binario arbol1 es prefijo de otro árbol binario arbol2, cuando arbol1 coincide
con la parte inicial del árbol arbol2 tanto en el contenido de los elementos como en su
estructura. Por ejemplo, en la siguiente imagen: arbol1 ES prefijo de arbol2.
En esta otra, arbol1 NO es prefijo de arbol2 (el subárbol con raíz 93 no está en el árbol2)
En la siguiente, no coincide el contenido. El subárbol con raíz 37 figura con raíz 62, entonces arbol1
NO es prefijo de arbol2. 
*/

package tp2.ejercicio8;

import tp2.ejercicio1y2.*;

public class ParcialArboles {
	public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		if (arbol1.isEmpty() || arbol2.isEmpty())
			return arbol1.isEmpty() && arbol2.isEmpty(); // el primer if verifica si al menos uno de los arboles está vacío, si es así, pregunta si ambos árboles están vacíos, si es así tienen la misma estructura, c.c. no es prefijo
		return esPrefijoHelper(arbol1, arbol2); // Si entra acá es porque los 2 árboles tienen al menos un dato y puedo hacer la comparación correspondiente
	}
	private boolean esPrefijoHelper(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		if (arbol1.getData() != arbol2.getData()) {
			return false;
		}
		boolean res = true;
		if (arbol1.hasLeftChild()) {
			if (arbol2.hasLeftChild()) {
				res = res && esPrefijoHelper(arbol1.getLeftChild(), arbol2.getLeftChild()); // verifico que tengan el mismo contenido
			} else return false; // no poseen la misma estructura
		}
		if (arbol1.hasRightChild()) {
			if (arbol2.hasRightChild()) {
				res = res && esPrefijoHelper(arbol1.getRightChild(), arbol2.getRightChild()); // verifico que tengan el mismo contenido
			} else return false; // no poseen la misma estructura
		}
		return res;
	}
	public static void main(String[] args) {
		System.out.println("Test Ejercicio8");
		ParcialArboles parcialArboles = new ParcialArboles();
		
		BinaryTree<Integer> ab1 = new BinaryTree<Integer>(4);
		ab1.addLeftChild(new BinaryTree<Integer>(2));
		ab1.addRightChild(new BinaryTree<Integer>(6));
		ab1.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		ab1.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
		
		BinaryTree<Integer> ab2 = new BinaryTree<Integer>(4);
		ab2.addLeftChild(new BinaryTree<Integer>(2));
		ab2.addRightChild(new BinaryTree<Integer>(6));
		ab2.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		ab2.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
		ab2.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
		ab2.getRightChild().addRightChild(new BinaryTree<Integer>(8));
		
		BinaryTree<Integer> ab3 = new BinaryTree<Integer>(4);
		ab3.addLeftChild(new BinaryTree<Integer>(2));
		ab3.addRightChild(new BinaryTree<Integer>(6));
		ab3.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		ab3.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
		
		BinaryTree<Integer> ab4 = new BinaryTree<Integer>(4);
		ab4.addLeftChild(new BinaryTree<Integer>(2));
		ab4.addRightChild(new BinaryTree<Integer>(6));
		ab4.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
		ab4.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
		
		BinaryTree<Integer> ab5 = new BinaryTree<Integer>();
		BinaryTree<Integer> ab6 = new BinaryTree<Integer>();
		
		BinaryTree<Integer> ab7 = new BinaryTree<Integer>(3);
		BinaryTree<Integer> ab8 = new BinaryTree<Integer>();
		
		BinaryTree<Integer> ab9 = new BinaryTree<Integer>();
		BinaryTree<Integer> ab10 = new BinaryTree<Integer>(3);
		
		System.out.println("Ab1 es prefijo de ab2? " + parcialArboles.esPrefijo(ab1, ab2) );
		System.out.println("Ab1 es prefijo de ab2? " + parcialArboles.esPrefijo(ab3, ab4) );
		System.out.println("Ab1 es prefijo de ab2? " + parcialArboles.esPrefijo(ab5, ab6) );
		System.out.println("Ab1 es prefijo de ab2? " + parcialArboles.esPrefijo(ab7, ab8) );
		System.out.println("Ab1 es prefijo de ab2? " + parcialArboles.esPrefijo(ab9, ab10) );
		
		
	}
}
