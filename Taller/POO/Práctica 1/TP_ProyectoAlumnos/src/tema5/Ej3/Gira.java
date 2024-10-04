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
public class Gira extends Recital {
    private String nombreGira;
    private Fecha[] fechas;
    private int fechaProx;
    private int cantFechas;
    private int fechaActual = 0;

    public Gira(String nombre, String nombreBanda, int cantFechas, int cantMax) {
        super(nombreBanda, cantMax);
        this.nombreGira = nombre;
        this.cantFechas = cantFechas;
        this.fechas = new Fecha[cantFechas];
        this.fechaProx = 0;
        for (int i = 0; i < this.cantFechas; i++) {
            this.getFechas()[i] = null;
        }
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }
    
    public void agregarFecha(Fecha fecha) {
        if (this.fechaActual < getCantFechas()) {
            this.fechas[fechaActual] = fecha;
            this.fechaActual++;
        }
    }
    
    public String actuar() {
        String aux = "";
        for (int k = 0; k < fechaProx; k++) {
            aux = aux + "Gira numero " + (k+1) + ": Buenas noches " + this.fechas[k].getCiudad() + "\n";
            aux += super.actuar() + "\n";
        }
        return aux;
    }
    
    @Override
    public int calcularCosto() {
        int i, aux = 0;
        for (i = 0; i < this.fechaProx; i++) {
            aux++;
        }
        aux = aux * 30000;
        return aux;
    }
}
