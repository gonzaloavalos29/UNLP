package tp2.ejercicio6;

import java.util.*;
import tp2.ejercicio1y2.*;

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
		BinaryTree<Integer> ab = new BinaryTree<Integer>(1);
		ab.addLeftChild(new BinaryTree<Integer>(2));
		ab.addRightChild(new BinaryTree<Integer>(3));
		ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(4));
		ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
		ab.getRightChild().addRightChild(new BinaryTree<Integer>(6));
		ab.getRightChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(7));
		ab.getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(8));
		
		ab.imprimirArbol();
		Transformacion tras = new Transformacion(ab);
		tras.suma();
		System.out.println();
		System.out.println("Arbol transformado");
		tras.getAb().imprimirArbol();
	}
}
