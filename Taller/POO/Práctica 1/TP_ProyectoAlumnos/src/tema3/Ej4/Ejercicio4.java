/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ej4;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author chach
 */
public class Ejercicio4 {
    
    public static void main(String[] args) {
        
        Hotel hotel1 = new Hotel(15);
        int i;
        int numHab = 1;
        for (i=0; i < 8; i++) {
            Persona c = new Persona(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(50)+100, GeneradorAleatorio.generarInt(100));
            hotel1.agregarCliente(c, numHab);
            numHab += 2;
        }
        System.out.println(hotel1.toString());
        hotel1.aumentarPrecios(100.10);
        System.out.println(hotel1.toString());
    }
    
}
