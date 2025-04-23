package Practica1.Ej3;

import java.util.Random;

public class Ej3 {
    public static void main(String[] args) {
        Random rand = new Random();
        
        Estudiante vecEstudiantes[] = new Estudiante[2];
        Profesor vecProfesores[] = new Profesor[3];

        int i, j;

        for(i = 0; i < 2; i++) {
            vecEstudiantes[i] = new Estudiante(
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand)
            );
        }

        for(j = 0; j < 3; j++) {
            vecProfesores[j] = new Profesor(
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand),
                generarStringAleatorio(4, rand)
            );
        }

        for(i = 0; i < 2; i++) {
            System.out.println(vecEstudiantes[i].tusDatos());
        }

        for(j = 0; j < 3; j++) {
            System.out.println(vecProfesores[j].tusDatos());
        }
    }

    public static String generarStringAleatorio(int longitud, Random rand) {
        String letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < longitud; i++) {
            int index = rand.nextInt(letras.length());
            sb.append(letras.charAt(index));
        }
        return sb.toString();
    }
}

