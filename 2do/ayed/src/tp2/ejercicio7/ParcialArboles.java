package tp2.ejercicio7;

import tp2.ejercicio1y2.BinaryTree;

public class ParcialArboles {

	private BinaryTree<Integer> ab;
	
	public ParcialArboles(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	private BinaryTree<Integer> getAb() {
		return ab;
	}
	
	private int contarUnicoHijo(BinaryTree<Integer> arb) {
		int cant = 0;
		if (arb.hasLeftChild()) cant += contarUnicoHijo(arb.getLeftChild());
		if (arb.hasRightChild()) cant += contarUnicoHijo(arb.getRightChild());
		if ((arb.hasLeftChild() && !arb.hasRightChild()) || (!arb.hasLeftChild() && arb.hasRightChild())) cant++;
		return cant;
	}
	
	private boolean isLeftTree(BinaryTree<Integer> arb) {
		int ramaIzq = -1;
		int ramaDer = -1;
		if (arb.hasLeftChild()) ramaIzq = contarUnicoHijo(arb.getLeftChild());
		if (arb.hasRightChild()) ramaDer = contarUnicoHijo(arb.getRightChild());
		return ramaIzq > ramaDer;
	}
	
	private BinaryTree<Integer> buscar(BinaryTree<Integer> ab, int num) {
		if (ab.getData() == num) return ab;
		BinaryTree<Integer> res = new BinaryTree<Integer>();
		if (ab.hasLeftChild()) {
			res = buscar(ab.getLeftChild(), num);
		}
		if ((ab.hasRightChild()) && (res.isEmpty())) {
			res = buscar(ab.getRightChild(), num);
		}
		return res;
	}
	
	public boolean isLeftTree(int num) {
		BinaryTree<Integer> arb = buscar(ab, num);
		return (!arb.isEmpty()) ? isLeftTree(arb) : false;
	}
	
	public static void main (String[] args) {
		System.out.println("Test Ejercicio 7");
		
		BinaryTree<Integer> ab = new BinaryTree<Integer>(2);
		ab.addLeftChild(new BinaryTree<Integer>(7));
		
	}
	
}
