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
public class Gira extends Recital {
    
    private String nombreGira;
    private Fecha [] fechas;
    private int cantFechas = 0;
    private int indice = 0;
    private int gira_dimL = 0;

    public Gira(String nombreBanda, int cantTemas, String nombreGira, int cantFechas) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.cantFechas = cantFechas;
        this.fechas = new Fecha[this.cantFechas];
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    
    public void agregarFecha(Fecha nuevaFecha) {
        if (this.gira_dimL < this.cantFechas) {
            fechas[gira_dimL] = nuevaFecha;
            gira_dimL++;
        } else {
            System.out.println("Nueva fecha no disponible, gira llena");
        }
    }
    
    public void actuar() {
        if (this.fechas[indice] != null) {
            System.out.println("Buenas noches... " + this.fechas[indice].getCiudad());
        }
        super.actuar();
        if (this.indice < this.gira_dimL) {
            this.indice++;
        } else {
            System.out.println("Ya no hay más fechas");
        }
    }

    @Override
    public int calcularCosto() {
        return (30000 * this.gira_dimL);
    }
    
}
