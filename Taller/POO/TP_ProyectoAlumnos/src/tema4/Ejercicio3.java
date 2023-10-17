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
public class Ejercicio3 {
    
    public static void main(String[] args) {
        String nombre1 = "Milton", nombre2 = "Kevin", oficio = "Freelancer";
        int DNI1 = 151334811, DNI2 = 1439221995, edad1 = 94, edad2 = 60;
        Persona persona = new Persona(nombre1, DNI1, edad1);
        Trabajador trabajador = new Trabajador(oficio, nombre2, DNI2, edad2);
        
        System.out.println(persona.toString());
        System.out.println(trabajador.toString());
    }
    
}
