/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gonzalo
 */
public class Ejercicio2 {
    
    public static void main(String[] args) {
        Jugador messi = new Jugador("Messi", 150, 20, 10, 10);
        Entrenador scaloni = new Entrenador("Scaloni", 50, 2, 10);
        System.out.println(messi.toString());
        System.out.println(scaloni.toString());
    }
    
}
