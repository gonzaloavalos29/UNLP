package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
import tema2.Persona;

public class Hotel {
    int nroHabitaciones;
    Habitacion [] habitaciones;
    Persona cliente;
    
    public Hotel(int nro){
        nroHabitaciones = nro;
        habitaciones = new Habitacion[nroHabitaciones];
        int i;
        boolean estaOcupada;
        GeneradorAleatorio.iniciar();
        int numAleatorio;
        for(i=0; i < nroHabitaciones; i++){
            System.out.println("¿La habitación {" + i + "} está ocupada? (ingrese 'true' si la respuesta es sí, de lo contrario ingrese 'false')");
            estaOcupada = Lector.leerBoolean();
            numAleatorio = GeneradorAleatorio.generarInt(6000) + 2000;
            if (estaOcupada) {
                System.out.println("Ingrese su nombre: ");
                cliente.setNombre(Lector.leerString());
                System.out.println("Ingrese su DNI: ");
                cliente.setDNI(Lector.leerInt());
                System.out.println("Ingrese su edad");
                cliente.setEdad(Lector.leerInt());
                habitaciones[i] = new Habitacion(numAleatorio, true, cliente);
            } else {
                habitaciones[i] = new Habitacion(numAleatorio, false, null);
            }
        }
    }
    
}
