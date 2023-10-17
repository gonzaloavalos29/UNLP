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
public class SistemaAño extends Sistema {
    
    private double [] tempEstacion; // Vector que registra promedios de temperatura de tal año
    int i;

    public SistemaAño(String nombre, String latitud, String longitud, int añosConsecutivos, int añoBase) {
        super(nombre, latitud, longitud, añosConsecutivos, añoBase);
        this.tempEstacion = new double [this.getAñosConsecutivos()]; // porque lo tenemos que hacer con los años
        // Inicializo cada valor del vector
        for (i = 0; i < this.getAñosConsecutivos(); i++)
            this.tempEstacion[i] = 999;
    }
    
    // Métodos heredados
    @Override
    public void registrarTemp(double input1, int input2) {
        this.tempEstacion[input2 - this.getAñoBase()] = input1; // Resto al input2 el añoBase para saber a qué índice del vector acceder
    }
    
    @Override
    public double obtenerTemp(int input1) {
        return (this.tempEstacion[input1 - this.getAñoBase()]);
    }
    
    @Override
    public String devolverMayorTemp() {
        int añoMax = 0;
        double tempMax = -1;
        for (int i = 0; i < this.getAñosConsecutivos(); i++) { // itera los meses buscando la mayor temperatura
            if (this.tempEstacion[i] > tempMax) { // si la encuentra, actualiza temp. max
                tempMax = this.tempEstacion[i];
                añoMax = i;
            }
        }
        String aux = "La mayor temperatura registrada (" + tempMax + ") ocurrió en el año " + (añoMax + this.getAñoBase());
        return aux;
    }
    
    //toString
    @Override
    public String toString() {
        String aux = super.toString(); // Buscar el toString() a partir de la clase arriba en la jerarquía
        for (int i = 0; i < this.getAñosConsecutivos(); i++)
            aux = aux + "\n Año " + (this.getAñoBase() + i) + ": " + this.tempEstacion[i] + " °C";
        return aux;
    }
    
}
