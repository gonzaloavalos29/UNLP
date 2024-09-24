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
public class Ej4 {
    public static void main(String[] args) {
        Persona[][] casting = new Persona[5][8];
        int i = 0;
        boolean corte = false;
        int dni, edad, cantInscriptos = 0;
        String nombre;
        System.out.println("Ingrese nombre: ");
        nombre = Lector.leerString();
        dni = 0;
        edad = 0;
        if (nombre.equals("ZZZ")) {
            corte = true;
            System.out.println("Terminado");
        } else {
            System.out.println("Ingrese dni: ");
            dni = Lector.leerInt();
            System.out.println("Ingrese edad: ");
            edad = Lector.leerInt();
        }
        
        for (i = 0; i < 5; i++) {
            for (int j = 0; i < 8; j++) {
                casting[i][j].setNombre("");
            }
        }
        
        while ((i < 5) && !(corte)) {
            int j = 0;
            System.out.println();
            while ((j < 8) && !(corte) && !(casting[i][j].getNombre().equals(""))) {
                if (casting[i][j].getNombre().equals("")) {
                    casting[i][j] = new Persona(nombre, dni, edad);
                    System.out.print("Dia: ("+(i+1)+") "+"Turno: ("+(j+1)+") ");
                    System.out.println(casting[i][j].toString());
                    cantInscriptos++;
                    nombre = Lector.leerString();
                    if (nombre.equals("ZZZ")) {
                        corte = true;
                        System.out.println("Terminado");
                    } else {
                        System.out.println("Ingrese dni: ");
                        dni = Lector.leerInt();
                        System.out.println("Ingrese edad: ");
                        edad = Lector.leerInt();
                    }
                }
                j++;
            }
            i++;
        }
    }
}
