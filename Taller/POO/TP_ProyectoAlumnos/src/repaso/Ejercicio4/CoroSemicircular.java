/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio4;

/**
 *
 * @author Gonzalo
 */
public class CoroSemicircular extends Coro {
    
    private Corista [] vec_coristas;
    private int dimL;
    private int indice = 0;

    public CoroSemicircular(Director director, int cantCoristas) {
        super(director, cantCoristas);
        this.vec_coristas = new Corista [this.dimL];
        this.dimL = this.getCantCoristas();
    }

    @Override
    public void agregarCorista(Corista nuevoCorista) {
        if (this.indice < this.dimL) {
            this.vec_coristas[this.indice] = nuevoCorista;
            this.indice++;
        } else {
            System.out.println("Error: El coro está lleno");
        }
    }

    @Override
    public boolean estaLleno() {
        return (indice == dimL); // Compara el valor de la variable índice con la dimL para ver si está lleno.
    }

    @Override
    public boolean estaBienFormado() {
        boolean aux = true;
        int valorPasado = 9999, valorActual, i = 0;
        while (i < indice && aux) { // Mientras i sea menor q índice y el coro se encuentre "bien formado"
            valorActual = this.vec_coristas[i].getTonoFundamental(); // Obtengo valor de tono del corista actual
            if (valorActual >= valorPasado)
                aux = false;
            valorPasado = valorActual;
            i++;
        }
        return aux;
    }

    @Override
    public String mostrarCoristas() {
        String aux = "";
        for (int i = 0; i < this.indice; i++) // Agrego corista
            aux = aux + this.vec_coristas[i].toString() + "\n";
        return aux;
    }
}
