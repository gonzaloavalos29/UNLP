/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Ej2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona[] vectorPersonas = new Persona[15];
        int i = 0;
        boolean edadEs0 = false;
        String nombre = GeneradorAleatorio.generarString(10);
        int dni = GeneradorAleatorio.generarInt(10000000);
        int edad = GeneradorAleatorio.generarInt(150);
        if (edad == 0) {
            edadEs0 = true;
        }
        while ((i < 15) && !(edadEs0)) {
            vectorPersonas[i] = new Persona(nombre, dni, edad);
            System.out.print("("+i+")");
            System.out.println(vectorPersonas[i].toString());
            nombre = GeneradorAleatorio.generarString(10);
            dni = GeneradorAleatorio.generarInt(10000000);
            edad = GeneradorAleatorio.generarInt(150);
            if (edad == 0) {
                edadEs0 = true;
            }
            i++;
        }
    }
}
