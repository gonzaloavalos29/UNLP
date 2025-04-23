package Practica2.Ej6;

import Practica2.Ej1y2.ArbolBinario;

public class Transformacion {

	private ArbolBinario<Integer> ab;
	
	public Transformacion(ArbolBinario<Integer> unArbol) {
		ab = unArbol;
	}
	
	public ArbolBinario<Integer> getAb() {
		return ab;
	}
	
	public ArbolBinario<Integer> suma() {
		suma(ab);
		return ab;
	}
	
	private int suma(ArbolBinario<Integer> ab) {
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
	
	public static void main (String[] args) {
		System.out.println("Test Transformacion");
		ArbolBinario<Integer> ab = new ArbolBinario<Integer>(4);
		ab.addLeftChild(new ArbolBinario<Integer>(2));
		ab.addRightChild(new ArbolBinario<Integer>(6));
		ab.getLeftChild().addLeftChild(new ArbolBinario<Integer>(1));
		ab.getLeftChild().addRightChild(new ArbolBinario<Integer>(3));
		ab.getRightChild().addLeftChild(new ArbolBinario<Integer>(5));
		ab.getRightChild().addRightChild(new ArbolBinario<Integer>(8));
		
		ab.imprimirArbol();
		Transformacion trans = new Transformacion(ab);
		trans.suma();
		System.out.println();
		System.out.println("Arbol transformado");
		trans.getAb().imprimirArbol();
	}
	
}
