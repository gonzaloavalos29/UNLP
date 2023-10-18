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
public class ParcialGNC {
    
    public static void main(String[] args) {
        
        Venta venta = new Venta("43582786", 10, 20.20, "Efectivo");
        Surtidor surtidor = new Surtidor(false, 2);
        Estacion estacion = new Estacion("Costa Rica 2390", 20.90);
        surtidor.agregarVenta(venta);
        estacion.agregarSurtidor(surtidor);
        estacion.marcarFuera(11);
        
        System.out.println(estacion.toString());
    }
    
}
