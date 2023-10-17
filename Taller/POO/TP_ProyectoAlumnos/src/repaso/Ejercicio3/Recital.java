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
public abstract class Recital {
    
    private String nombreBanda;
    private String [] temas;
    private int dimL = 0;
    private int cantTemas;

    public Recital(String nombreBanda, int cantTemas) {
        setNombreBanda(nombreBanda);
        this.cantTemas = cantTemas;
        this.temas = new String[this.cantTemas];
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public void agregarTema(String nombreTema) {
        if (this.dimL < this.cantTemas) {
            this.temas[dimL] = nombreTema;
            this.dimL++;
        } else {
            System.out.println("Vector de canciones lleno.");
        }
    }
    
    public void actuar() {
        for (int i = 0; i < this.dimL; i++) {
            System.out.println("Y ahora tocaremos... " + this.temas[i]);
        }
    }

    public abstract int calcularCosto();
    
}
