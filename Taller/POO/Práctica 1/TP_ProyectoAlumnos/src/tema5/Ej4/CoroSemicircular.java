/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej4;

/**
 *
 * @author chach
 */
public class CoroSemicircular extends Coro {
    private Corista[] coristas;

    public CoroSemicircular(String nombreCoro, Director director, int cantCoristas) {
        super(nombreCoro, director, cantCoristas);
        coristas = new Corista[cantCoristas];
    }

    @Override
    public void agregarCorista(Corista corista) {
        if (super.getCantActual() < super.getCantCoristas()) {
            this.coristas[super.getCantActual()] = corista;
            super.setCantActual(super.getCantActual()+1);
        }
    } 

    @Override
    public boolean estaBienFormado() {
        boolean aux = true;
        int i = 0;
        while (i < super.getCantActual() && aux == true){
            if (coristas[i+1].getTono() > coristas[i].getTono()) {
                aux = false;
            } else {
                i++;
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        for (int i = 0; i < super.getCantActual(); i++) {
            aux += coristas[i].toString() + "\n";
        }
        return aux;
    }
}
