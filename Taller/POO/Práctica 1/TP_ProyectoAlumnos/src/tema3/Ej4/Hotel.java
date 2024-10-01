/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ej4;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Hotel {
    private Habitacion[] habitaciones;
    private int numHabitaciones = 10;
    
    public Hotel() {
        habitaciones = new Habitacion[numHabitaciones]; 
        //Todas las posiciones del vector apuntaran a null gracias a Java, hasta que se hagan new Hotel[pos]
    }
    
    public Hotel(int nro) {
        numHabitaciones = nro;
        habitaciones = new Habitacion[nro]; // java inicializa habitaciones en null
        for (int i = 0; i < nro; i++) {
            habitaciones[i] = new Habitacion(); // inicializar cada habitación
        }
    }

    public int getNumHabitaciones() {
        return numHabitaciones;
    }

    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }
    
    public void aumentarPrecios(double n) {
        for (int i = 0; i < numHabitaciones; i++) {
            habitaciones[i].aumentarPrecio(n);
        }
    }
    
    public void agregarCliente(Persona c, int hab) {
        this.habitaciones[hab-1].setPersona(c);
        this.habitaciones[hab-1].ocupar();
    }
    
    @Override
    public String toString() {
        String aux = "";
        for (int n = 0; n <numHabitaciones; n++) {
            aux += "Habitacion " + (n+1) + ": " + this.habitaciones[n].toString() + "\n" ;
        }
        return aux;
    }
    
}
