/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author chach
 */
public class Ej1 {
    public static void main(String[] args) {
        System.out.println("Ingrese un nombre: ");
        String nombre = Lector.leerString();
        System.out.println("Ingrese un dni: ");
        int dni = Lector.leerInt();
        System.out.println("Ingrese una edad: ");
        int edad = Lector.leerInt();
        Persona persona = new Persona(nombre, dni, edad);
//        persona.setNombre(nombre);
//        persona.setDNI(dni);
//        persona.setEdad(edad);
        System.out.println(persona.toString());
//        persona.getNombre();
//        persona.getEdad();
//        persona.getDNI();
    }
}
