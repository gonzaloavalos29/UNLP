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
public class Estacionamiento {
    
    private String nombre;
    private String direccion;
    private double horaApertura;
    private double horaCierre;
    private Auto[][] matriz;
    private int cantPiso;
    private int cantPlazas;
    
    public void inicializarMatriz(int n, int a) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < a; j++) {
                this.matriz[i][j] = null;
            }
        }
    }
    
    public Estacionamiento(String nombre, String dir) {
        this.nombre= nombre;
        this.direccion = dir;
        this.horaApertura = 8;
        this.horaCierre = 21;
        this.cantPiso = 5;
        this.cantPlazas = 10;
        this.matriz = new Auto[cantPiso][cantPlazas];
        this.inicializarMatriz(cantPiso, cantPlazas);
    }
    
    public Estacionamiento(String nom, String dir, int hora1, int hora2, int nropiso, int nroplazas) {
        this.nombre = nom;
        this.direccion = dir;
        this.horaApertura = hora1;
        this.horaCierre = hora2;
        this.matriz = new Auto[nropiso][nroplazas];
        this.cantPiso = nropiso;
        this.cantPlazas = nroplazas;
        this.inicializarMatriz(nropiso, nroplazas);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(double horaApertura) {
        this.horaApertura = horaApertura;
    }

    public double getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(double horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getCantPiso() {
        return cantPiso;
    }

    public void setCantPiso(int cantPiso) {
        this.cantPiso = cantPiso;
    }

    public int getCantPlazas() {
        return cantPlazas;
    }

    public void setCantPlazas(int cantPlazas) {
        this.cantPlazas = cantPlazas;
    }
    
    public void agregarAuto(Auto a, int x, int y) {
        this.matriz[x-1][y-1] = a;
    }
    
    public String buscarAuto(String str) {
        boolean encontrado = false;
        String aux = "Auto Inexistente.";
        int piso = 0, plaza = 0;
        while (!(encontrado) && (piso < this.cantPiso)) {
            if (this.matriz[piso][plaza] != null && this.matriz[piso][plaza].getPatente().equals(str)) {
                encontrado = true;
                aux = "Se encuentra en el piso " + (piso+1) + " plaza " + (plaza+1);
            } else {
                plaza++;
                if (plaza == this.getCantPlazas()) {
                    plaza = 0;
                    piso++;
                }
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = "", cero;
        for (int i = 0; i < this.getCantPiso(); i++) {
            for (int j = 0; j < this.getCantPlazas(); j++) {
                if (this.matriz[i][j] == null) {
                    cero = "libre";
                } else {
                    cero = this.matriz[i][j].toString();
                }
                aux += " Piso: " + (i+1) + " Plaza: " + (j+1) + " | " + cero + " | ";
            }
            aux = aux + "\n";
        }
        return aux;
    }
    
    public int autosXPlaza(int y) {
        int i, aux = 0;
        for (i = 0; i < this.cantPiso; i++) {
            if (this.matriz[i][y-1] != null)
                aux++;
        }
        return aux;
    }
}
