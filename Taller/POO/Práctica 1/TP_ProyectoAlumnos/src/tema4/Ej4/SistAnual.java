/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej4;

/**
 *
 * @author chach
 */
public class SistAnual extends Sistema {
    public SistAnual(int anioInicial, int cantAnios, Estacion estacion) {
        super(anioInicial, cantAnios, estacion);
    }

    @Override
    public String retornarMedia() {
        String aux = "";
        double total;
        for (int i = 0; i < this.getCantAnios(); i++) {
            total = 0;
            for (int j = 0; i < 12; j++) {
                total += getTemp(j+1, i+this.getAnioInicial());
            }
            aux += "Anio " + (i + this.getAnioInicial()) + ": " + Math.round((total/12)*100)/100.0 + "°C \n";
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return super.toString();
    }
    
}
