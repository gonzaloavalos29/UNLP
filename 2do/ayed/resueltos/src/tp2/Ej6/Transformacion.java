/* Ejercicio 6
Cree una clase Java llamada Transformacion que tenga como variable de instancia un árbol
binario de números enteros y un método de instancia suma (): BinaryTree<Integer> el cuál
devuelve el árbol en el que se reemplazó el valor de cada nodo por la suma de todos los
elementos presentes en su subárbol izquierdo y derecho. Asuma que los valores de los subárboles
vacíos son ceros. Por ejemplo:
¿Su solución recorre una única vez cada subárbol? En el caso que no, ¿Puede mejorarla para que sí lo haga?
Los siguientes ejercicios fueron tomados en parciales, en los últimos años. Tenga en cuenta que:
	1. No puede agregar más variables de instancia ni de clase a la clase ParcialArboles.
	2. Debe respetar la clase y la firma del método indicado.
	3. Puede definir todos los métodos y variables locales que considere necesarios.
	4. Todo método que no esté definido en la sinopsis de clases debe ser implementado.
	5. Debe recorrer la estructura solo 1 vez para resolverlo.
	6. Si corresponde, complete en la firma del método el tipo de datos indicado con signo de “?”
*/

package tp2.Ej6;

import tp2.Ej1y2.BinaryTree;

public class Transformacion {
	private BinaryTree<Integer> ab;
	
	public Transformacion(BinaryTree<Integer> unArbol) {
		ab = unArbol;
	}
	
	public BinaryTree<Integer> getAb() {
		return ab;
	}

	public BinaryTree<Integer> suma() {
		suma(ab);
		return ab;
	}
	
	private int suma(BinaryTree<Integer> ab) {
		int sum = 0;
		if (ab.isLeaf()) {
			sum = ab.getData();
			ab.setData(0);
			return sum;
		}
		if (ab.hasLeftChild()) {
			sum += suma(ab.getLeftChild());
		}
		if (ab.hasRightChild()) {
			sum += suma(ab.getRightChild());
		}
		int actual = ab.getData();
		ab.setData(sum);
		return actual + sum;
	}
	
	public static void main(String[] args) {
		System.out.println("Test Transformacion");
		BinaryTree<Integer> ab = new BinaryTree<Integer>(4);
		ab.addLeftChild(new BinaryTree<Integer>(2));
		ab.addRightChild(new BinaryTree<Integer>(6));
		ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
		ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
		ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
		ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
	
		ab.imprimirArbol();
		Transformacion tras = new Transformacion(ab);
		tras.suma();
		System.out.println();
		System.out.println("Arbol transformado");
		tras.getAb().imprimirArbol();
	}
}
