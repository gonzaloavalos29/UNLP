package Practica2.Ej1y2;

import java.util.*;

public class ArbolBinario <T> {
	
    private T data;
    private ArbolBinario<T> leftChild;   
    private ArbolBinario<T> rightChild; 

    public ArbolBinario() {
        super();
    }

    public ArbolBinario(T data) {
        this.data = data;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
    /**
     * Preguntar antes de invocar si hasLeftChild()
     * @return
     */
    public ArbolBinario<T> getLeftChild() {
        return leftChild;
    }
    /**
     * Preguntar antes de invocar si hasRightChild()
     * @return
     */
    public ArbolBinario<T> getRightChild() {
        return rightChild;
    }

    public void addLeftChild(ArbolBinario<T> child) {
        this.leftChild = child;
    }

    public void addRightChild(ArbolBinario<T> child) {
        this.rightChild = child;
    }

    public void removeLeftChild() {
        this.leftChild = null;
    }

    public void removeRightChild() {
        this.rightChild = null;
    }

    public boolean isEmpty(){
        return (this.isLeaf() && this.getData() == null);
    }

    public boolean isLeaf() {
        return (!this.hasLeftChild() && !this.hasRightChild());
    }

    public boolean hasLeftChild() {
        return this.leftChild!=null;
    }

    public boolean hasRightChild() {
        return this.rightChild!=null;
    }
    @Override
    public String toString() {
        return this.getData().toString();
    }

/* Ejercicio 2
Agregue a la clase BinaryTree los siguientes métodos:
a) contarHojas():int Devuelve la cantidad de árbol/subárbol hojas del árbol receptor.
b) espejo(): BinaryTree<T> Devuelve el árbol binario espejo del árbol receptor.
c) entreNiveles(int n, m) Imprime el recorrido por niveles de los elementos del árbol
receptor entre los niveles n y m (ambos inclusive). (0≤n<m≤altura del árbol) */    
    
    public int contarHojas() {
        int leftC =0; 
        int rightC = 0;
        if (this.isEmpty()) return 0;
        else if(this.isLeaf()) return 1;
        else {
            if(this.hasLeftChild()) 
                leftC = this.getLeftChild().contarHojas();
            if(this.hasRightChild()) 
                rightC = this.getRightChild().contarHojas();
            return leftC + rightC;
        }
    }	
    	 
    public ArbolBinario<T> espejo(){
        ArbolBinario<T> arbEspejo = new ArbolBinario<T>(this.getData());
        if(this.hasLeftChild()) {
            arbEspejo.addRightChild(this.getLeftChild().espejo());
        }
        if(this.hasRightChild()) {
            arbEspejo.addLeftChild(this.getRightChild().espejo());
        }
        return arbEspejo;
    }
    
    public void entreNiveles(int n, int m) {
        if (this.isEmpty() || n < 0 || m < n) return; 
        Queue<ArbolBinario<T>> cola = new LinkedList();
        cola.add(this);
        int nivelActual = 0;
        
        while(!cola.isEmpty()) {
            int nodoNivel = cola.size();
            if(nivelActual >=n && nivelActual <= m) {
                for(int i=0; i < nodoNivel; i++) {
                    ArbolBinario<T> nodo = cola.remove();
                    System.out.print(nodo.getData() + " | ");
                    if(nodo.hasLeftChild()) cola.add(nodo.getLeftChild());
                    if(nodo.hasRightChild()) cola.add(nodo.getRightChild());
                }
            } else {
                for(int i=0; i < nodoNivel; i++) {
                    cola.remove();
                }
            }
            nivelActual++;
            System.out.println("");
        }
    }
    
    public void imprimirArbol() {
        if(this.hasLeftChild()) this.getLeftChild().imprimirArbol();
        System.out.print(this.getData() + " ");
        if(this.hasRightChild()) this.getRightChild().imprimirArbol();
    }
    
    public static void main (String[] args) {
        System.out.println("Test metodos Arboles");
        ArbolBinario<Integer> ab = new ArbolBinario<Integer>(4);
        ab.addLeftChild(new ArbolBinario<Integer>(2));
        ab.addRightChild(new ArbolBinario<Integer>(6));
        ab.getLeftChild().addLeftChild(new ArbolBinario<Integer>(1));
        ab.getLeftChild().addRightChild(new ArbolBinario<Integer>(3));
        ab.getRightChild().addLeftChild(new ArbolBinario<Integer>(5));
        //ab.getRightChild().addRightChild(new BinaryTree<Integer>(8));
        
        System.out.println(ab.contarHojas());
        System.out.println("Arbol original: ");
        ab.imprimirArbol();
        System.out.println("Arbol espejo: ");
        ArbolBinario<Integer> abEspejo = ab.espejo();
        abEspejo.imprimirArbol();
        System.out.println("Impresion Arbol por niveles 0 y 1");
        ab.entreNiveles(0, 2);
    }
    
}
