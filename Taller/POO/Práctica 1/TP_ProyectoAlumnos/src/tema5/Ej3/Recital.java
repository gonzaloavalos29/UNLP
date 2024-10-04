/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej3;

/**
 *
 * @author chach
 */
public abstract class Recital {
    private String nombreBanda;
    private String[] temas;
    private int maxTemas;
    private int temaActual = 0;

    public Recital(String nombreBanda, int cantMax) {
        this.nombreBanda = nombreBanda;
        this.maxTemas = cantMax;
        this.temas = new String[cantMax];
        for (int i = 0; i < this.maxTemas; i++) {
            this.temas[i] = null;
        }
    }
    
    public void agregarTema(String tema) {
        if (this.temaActual < this.maxTemas) {
            this.temas[temaActual] = tema;
            this.temaActual++;
        }
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    public String Concatenador() {
        String aux = "";
        for (int i = 0; i < this.temaActual; i++) {
            aux = aux + "Y ahora tocaremos " + this.temas[i] + "\n";
        }
        return aux;
    }
    
    public String actuar() {
        String aux = "";
        aux = aux + " " + this.Concatenador();
        return aux;
    }
    
    public abstract int calcularCosto();
}
