/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio3;

/**
 *
 * @author Alumno
 */
public class Ejercicio3 {
    
    public static void main(String[] args) {

        Fecha f1 = new Fecha("La Plata", 6);
            EventoOcasional evento = new EventoOcasional("shOw privado", "Roberto", 3, "Radiohead", 2);
            Gira gira = new Gira("Tan Bionica", 6, "Gira Argentina", 10);
            evento.agregarTema("How to disappear completely");
            gira.agregarTema("Ciudad Magica");
            gira.agregarTema("Ella");
            gira.agregarFecha(f1);
            gira.agregarFecha(f1);
            System.out.println("Costo del evento ocasional: " + evento.calcularCosto());
            System.out.println("Costo de la gira: " + gira.calcularCosto());
            evento.actuar();
            System.out.println("");
            gira.actuar();
            gira.actuar();
    }
}
