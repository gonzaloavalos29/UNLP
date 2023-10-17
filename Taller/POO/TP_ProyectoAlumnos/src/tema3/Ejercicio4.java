/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author Alumno
 */
public class Ejercicio4 {
    
    public static void main(String[] args) {
        System.out.println("Ingrese cantidad de habitaciones del Hotel: ");
        int i, cantHabitaciones = Lector.leerInt();
        Hotel hotel = new Hotel(cantHabitaciones);
        for (i = 0; i < cantHabitaciones; i++) {
            System.out.println("Habitación nro: " + i);
        }
    }
    
}
