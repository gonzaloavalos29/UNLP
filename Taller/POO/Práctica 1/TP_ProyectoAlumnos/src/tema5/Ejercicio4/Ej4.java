/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ejercicio4;

/**
 *
 * @author chach
 */
public class Ej4 {
    public static void main(String[] args) {
        
        Director direc1 = new Director("Matias", 555, 18,3);
        CoroSemicircular corosemic = new CoroSemicircular(direc1, 3, "CoroSemic");
        Corista corista1 = new Corista("Pepe", 333, 3);
        Corista corista2 = new Corista("Juan", 444, 2);
        Corista corista3 = new Corista("Rocio", 666, 1);
        corosemic.agregarCorista(corista1);
        corosemic.agregarCorista(corista2);
        corosemic.agregarCorista(corista3);
        System.out.println(corosemic.toString()); 
        System.out.println(corosemic.CoroLleno());
        System.out.println(corosemic.estaBienFormado());
        
        System.out.println("-------------------");
        
        Director direc2 = new Director("Lucio", 222, 21,2);
        CoroHileras corohil = new CoroHileras(direc2, 4, "CoroHileras", 2, 3);
        Corista corista4 = new Corista("Gonzalo", 542, 3);
        Corista corista5 = new Corista("Veronica", 324, 3);
        Corista corista6 = new Corista("Laura", 675, 3);
        Corista corista7 = new Corista("Eduardo", 338, 1);
        Corista corista8 = new Corista("Victoria", 427, 1);
        Corista corista9 = new Corista("Cecilia", 926, 1);
        corohil.agregarCorista(corista4);
        corohil.agregarCorista(corista5);
        corohil.agregarCorista(corista6);
        corohil.agregarCorista(corista7);
        corohil.agregarCorista(corista8);
        corohil.agregarCorista(corista9);
        System.out.println(corohil.toString());
        System.out.println(corohil.estaLleno());
        System.out.println(corohil.estaBienFormado());
        
    }
}
