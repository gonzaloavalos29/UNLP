/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej2;

/**
 *
 * @author chach
 */
public class Auto {
    private String nombreDuenio;
    private String patente;

    public Auto(String nombreDuenio, String patente) {
        this.nombreDuenio = nombreDuenio;
        this.patente = patente;
    }

    public String getNombreDuenio() {
        return nombreDuenio;
    }

    public void setNombreDuenio(String nombreDuenio) {
        this.nombreDuenio = nombreDuenio;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombreDuenio=" + nombreDuenio + ", patente=" + patente + '}';
    }
    
}
