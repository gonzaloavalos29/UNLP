/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ejercicio4;

/**
 *
 * @author chach
 */
public class CoroSemicircular extends Coro{
    private Corista[] vector;
    
    public CoroSemicircular(Director direc, int cantCoristas, String nom) {
        super(direc, cantCoristas, nom);
        this.vector = new Corista[cantCoristas];
    }
    
    public void agregarCorista(Corista unCorista) {
        if(this.getDiml() < this.getCantCoristas()) {
            this.vector[this.getDiml()] = unCorista;
            this.incrementarDiml();
        }
    }
    
    public boolean estaLleno() {
        return this.getDiml() == this.getCantCoristas();
    }
    
    public boolean estaBienFormado() {
        boolean cumple = true;
        int min = 999;
        int i = 0;
        while((i < this.getDiml()) && (cumple)) {
            if(this.vector[i].getTono() < min) {
                min = this.vector[i].getTono();
            } else {
                cumple=false;
            }
            i++;
        }
        return cumple;
    }
    
    @Override
    public String toString() {
        String dataCoristas = " ";
        for(int i=0; i < this.getDiml(); i++) {
            dataCoristas += vector[i].toString() + " | ";
        }
        return super.toString() + dataCoristas;
    }
    
}