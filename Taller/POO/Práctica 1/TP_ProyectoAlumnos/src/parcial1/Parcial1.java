/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author chach
 */
public class Parcial1 {
    public static void main(String[] args) {
        
        AlumnoDeGrado alu1;
        AlumnoDoctorado alu2;
        Materia mat;
        
        alu1 = new AlumnoDeGrado("Diplomatura en Esports", 777, "Estanislao Andrés", 37);
        alu2 = new AlumnoDoctorado("Analista Programador Universitario", "Universidad Nacional de La Plata", 657, "Gonzalo Matias Avalos", 20);
        
        for (int i = 0; i < alu1.getCantMax(); i++) {
            mat = new Materia(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarDouble(10), GeneradorAleatorio.generarInt(24));
            alu2.agregarMateria(mat);
        }
        
        System.out.println(alu1.toString());
        System.out.println(alu2.toString());
    }
}
