/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Ejercicio3 {
    
    public static void main(String[] args) {
        EventoOcasional ev1;
        Gira gira1;
        Fecha f;
        
        ev1 = new EventoOcasional(2, "Evento Oc.", 9, "Banda de Matias", 12); //Son 12 temas
        for(int i=0; i<12; i++) {
            ev1.agregarTema(GeneradorAleatorio.generarString(4));
        }
        gira1 = new Gira("Gira por LATAM", "Banda de Pancho", 10, 5); //Son 10 temas y  5 fechas
        for(int j=0; j<10; j++) {
            gira1.agregarTema(GeneradorAleatorio.generarString(4));
        }
        for(int k=0; k<5; k++) {
            f = new Fecha(GeneradorAleatorio.generarString(6), GeneradorAleatorio.generarInt(31)+1);
            gira1.agregarFecha(f);
        }
        
        System.out.println(ev1.actuar());
        System.out.println("-------------------------");
        
        System.out.println(gira1.actuar());
        System.out.println("---------------------------");
        
        ev1.agregarTema("FEELS");
        ev1.agregarTema("Waka-Waka");
        System.out.println(ev1.calcularCosto());
        System.out.println(ev1.actuar());
        
        System.out.println("---------------------------");
        f = new Fecha("La Plata" , 31);
        gira1.agregarFecha(f);
        gira1.agregarTema("FEELS");
        gira1.agregarTema("VVS");
        gira1.agregarTema("FR FR");
        
        System.out.println(gira1.calcularCosto());
        System.out.println(gira1.actuar());
        
        
    }
    
}
