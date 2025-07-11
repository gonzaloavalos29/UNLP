/* Ejercicio 4 
Una red binaria es una red que posee una topología de árbol binario lleno.
Los nodos que conforman una red binaria llena tiene la particularidad de que todos ellos conocen
cuál es su retardo de reenvío. El retardo de reenvío se define como el período comprendido entre
que un nodo recibe un mensaje y lo reenvía a sus dos hijos.
Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
hasta llegar a las hojas en una red binaria llena. En el ejemplo, debería retornar 10+3+9+12=34
(Si hay más de un máximo retorne el último valor hallado).
Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de
segundos.
a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
problema.
La estrategia a seguir es recorrido en profundidad ya que se debe recorrer todo el camino del arbol hasta cada hoja.
b) Cree una clase Java llamada RedBinariaLlena donde implementará lo solicitado en el
método retardoReenvio():int */

package Practica2.Ej4;

import java.util.*;
import Practica2.Ej1y2.ArbolBinario;

public class RedBinariaLlena {
    private ArbolBinario<Integer> red;
    
    public RedBinariaLlena(ArbolBinario<Integer> unArbolLleno) {
        this.red = unArbolLleno;
    }
    
    public int retardoReenvio() {
        return (!red.isEmpty()) ? retardoReenvio(red) : 0;
    }
    
    private int retardoReenvio(ArbolBinario<Integer> red) {
        int retHI = 0;
        int retHD = 0;
        if(red.hasLeftChild())
            retHI = retardoReenvio(red.getLeftChild());
        if(red.hasRightChild())
            retHD = retardoReenvio(red.getRightChild());
        return (Math.max(retHI, retHD)+ red.getData());
    }
    
    public static void main (String[] args) {
        System.out.println("Test mayor retardo");
        ArbolBinario<Integer> ab = new ArbolBinario<Integer>(4);
        ab.addLeftChild(new ArbolBinario<Integer>(2));
        ab.addRightChild(new ArbolBinario<Integer>(6));
        ab.getLeftChild().addLeftChild(new ArbolBinario<Integer>(1));
        ab.getLeftChild().addRightChild(new ArbolBinario<Integer>(3));
        ab.getRightChild().addLeftChild(new ArbolBinario<Integer>(5));
        ab.getRightChild().addRightChild(new ArbolBinario<Integer>(8));
        
        RedBinariaLlena red = new RedBinariaLlena(ab);
        System.out.println("El mayor retardo posible es de: " + red.retardoReenvio() + " segundos");
    }
}
