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
public class Ej5 {
    public static void main(String[] args) {
        final int maxPartidos = 20;
        Partido[] partidos = new Partido[maxPartidos];
//        for (int i = 0; i < maxPartidos; i++){
//            partidos[i].setGolesLocal(0);
//            partidos[i].setGolesVisitante(0);
//            partidos[i].setLocal("");
//            partidos[i].setVisitante("");
//        }
        
        int i = 0, cantGolesBoca = 0, cantGanadosRiver = 0;
        boolean corte = false;
        String visitante, local = "";
        int golesVisitante = 0, golesLocal = 0;
        System.out.println("Ingrese visitante: ");
        visitante = Lector.leerString();
        if (visitante.equals("ZZZ")) {
            corte = true;
        } else {
            System.out.println("Ingrese equipo local: ");
            local = Lector.leerString();
            System.out.println("Ingrese goles de local: ");
            golesLocal = Lector.leerInt();
            System.out.println("Ingrese goles de visitante: ");
            golesVisitante = Lector.leerInt();
        }
        while ((i < maxPartidos) && !(corte)) {
            partidos[i] = new Partido(local, visitante, golesLocal, golesVisitante);
            System.out.println("EQUIPO-LOCAL " + partidos[i].getGolesLocal() + " VS EQUIPO-VISITANTE " + partidos[i].getGolesVisitante());
            System.out.println("Ingrese visitante: ");
            visitante = Lector.leerString();
            if (visitante.equals("ZZZ")) {
                corte = true;
            } else {
                System.out.println("Ingrese equipo local: ");
                local = Lector.leerString();
                System.out.println("Ingrese goles de local: ");
                golesLocal = Lector.leerInt();
                System.out.println("Ingrese goles de visitante: ");
                golesVisitante = Lector.leerInt();
            }
            i++;
            if (partidos[i].getLocal().equals("Boca")) {
                cantGolesBoca = partidos[i].getGolesLocal();
            }
            if (partidos[i].hayGanador()) {
                if (partidos[i].getGanador().equals("River")) {
                    cantGanadosRiver++;
                }
            }
        }
        
    }
}
