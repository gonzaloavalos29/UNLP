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
    private int maxCoristas;
    private int coristasActivos = 0;

    public CoroSemicircular(String nombreCoro, Director director, int maxCoristas) {
        super(nombreCoro, director);
        this.maxCoristas = maxCoristas;
        this.coristas = new Corista[maxCoristas];
    }

    @Override
    public void agregarCorista(Corista corista) {
        if (this.coristasActivos < this.maxCoristas) {
            this.coristas[this.coristasActivos] = corista;
            this.coristasActivos++;
        } else {
            System.out.println("No hay mas lugar en el coro");
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

    @Override
    public boolean estaLleno() {
        return (this.coristasActivos == this.maxCoristas);
    }
}
