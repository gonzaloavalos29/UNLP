/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author chach
 */
public class Ejercicio2 {
    public static void main(String[] args) {
        
        Estacionamiento est1;
        Auto a;
        int i, j;
        
        est1 = new Estacionamiento("Estacionamiento Matungo", "50 y 120", 10, 21, 3, 3);
        
        for(i = 1; i<=3; i++) {
            for(j=1; j<=2; j++) {
                a = new Auto(GeneradorAleatorio.generarString(6), GeneradorAleatorio.generarString(4));
                est1.agregarAuto(a, j, i);
            }
        }
    
        System.out.println(est1.toString());
        System.out.println("Cantidad de autos ubicados en la plaza 1: " + est1.autosXPlaza(1));
        System.out.println("Ingrese un numero de patente");
        String aux = Lector.leerString();
        System.out.println(est1.buscarAuto(aux));
    }
    
}
