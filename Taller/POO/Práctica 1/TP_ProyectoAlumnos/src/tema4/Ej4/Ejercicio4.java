/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej4;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Ejercicio4 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacion est1 = new Estacion("La Plata", -34.921, -57.955);
        Estacion est2 = new Estacion("Mar del Plata", -38.002, -57.556);
        
        SistAnual sistAnual = new SistAnual(2021, 3, est1);
        SistMensual sistMensual = new SistMensual(2020, 4, est2);
        
        // Habría que setear todas las temperaturas...
        sistAnual.setTemp(1, 2021, 150);
        sistMensual.setTemp(5, 2022, 120);
        
        System.out.println(sistAnual);
        System.out.println(sistAnual.mayorTemp());
        
        System.out.println(sistMensual);
        System.out.println(sistMensual.mayorTemp());
    }
    
}
