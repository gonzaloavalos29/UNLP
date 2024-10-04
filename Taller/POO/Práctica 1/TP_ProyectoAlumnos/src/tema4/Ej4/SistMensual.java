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
public class SistMensual extends Sistema {
    private String[] meses = new String[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
        "Octubre", "Noviembre", "Diciembre"};
    public SistMensual(int anioInicial, int cantAnios, Estacion estacion) {
        super(anioInicial, cantAnios, estacion);
    }

    @Override
    public String retornarMedia() {
        String aux = "";
        double total;
        for (int i = 0; i < 12; i++) {
            total = 0;
            for (int j = 0; j < this.getCantAnios(); j++) {
                total += getTemp(i + 1, i + this.getAnioInicial());
            }
            aux += meses[i] + ": " + Math.round((total/this.getCantAnios())*100)/100.0 + "°C \n";
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return super.toString();
    }
}

