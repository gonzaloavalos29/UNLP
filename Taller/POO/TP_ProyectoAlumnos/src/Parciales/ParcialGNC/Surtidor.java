/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.ParcialGNC;

/**
 *
 * @author Gonzalo
 */
public class Surtidor {
    
    private boolean estaFueraDeServicio;
    private Venta vec_ventas [];
    private int dimF;
    private int dimL = 0;

    public Surtidor(boolean estaFueraDeServicio, int nroMax) {
        this.setEstaFueraDeServicio(estaFueraDeServicio);
        this.dimF = nroMax;
        
        vec_ventas = new Venta[this.dimF];
    }
    
    public boolean isEstaFueraDeServicio() {
        return estaFueraDeServicio;
    }

    public void setEstaFueraDeServicio(boolean estaFueraDeServicio) {
        this.estaFueraDeServicio = estaFueraDeServicio;
    }
    
    public void agregarVenta(Venta unaVenta) {
        if (this.dimL < this.dimF) {
            this.vec_ventas[this.dimL] = unaVenta;
            this.dimL++;
        } else {
            System.out.println("No hay más espacio.");
        }
    }
    
    public int obtenerCantCombustible() {
        int sumaCombustible = 0;
        for (int i = 0; i < dimL; i++) {
            sumaCombustible += vec_ventas[i].getCantCombustible();
        }
        return sumaCombustible;
    }
    
    public Venta maxVentaSurtidor() {
        double max = -1;
        Venta ventaMax = null;
        for (int i = 0; i < dimL; i++) {
            if (vec_ventas[i].getMontoAbonado() > max) {
                max = vec_ventas[i].getMontoAbonado();
                ventaMax = vec_ventas[i];
            }
        }
        return ventaMax;
    }

    @Override
    public String toString() {
        String aux = "";
        aux = "\n" + "¿Está fuera de servicio?: " + this.isEstaFueraDeServicio() + "\n";
        for (int i = 0; i < dimL; i++) {
            aux += "Venta nro: " + i + "\n" + vec_ventas[i].toString();
        }
        return aux;
    }
}
