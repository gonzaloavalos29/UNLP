/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Gonzalo
 */
public abstract class Sistema extends Estacion{
    private int añosConsecutivos;
    private int añoBase;

    public Sistema(String nombre, String latitud, String longitud, int añosConsecutivos, int añoBase) {
        super(nombre, latitud, longitud);
        this.añosConsecutivos = añosConsecutivos;
        this.añoBase = añoBase;
    }

    public int getAñosConsecutivos() {
        return añosConsecutivos;
    }

    public void setAñosConsecutivos(int añosConsecutivos) {
        this.añosConsecutivos = añosConsecutivos;
    }

    public int getAñoBase() {
        return añoBase;
    }

    public void setAñoBase(int añoBase) {
        this.añoBase = añoBase;
    }
    
    // Métodos abstractos
    public abstract void registrarTemp(double input1, int input2);
    public abstract double obtenerTemp(int input1);
    public abstract String devolverMayorTemp();
    
}
