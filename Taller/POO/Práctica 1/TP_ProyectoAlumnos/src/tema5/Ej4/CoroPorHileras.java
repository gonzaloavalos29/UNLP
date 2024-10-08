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
public class CoroPorHileras extends Coro {
    private Corista[][] coristas;
    private int filas;
    private int columnas;
    private int totalCoristas;
    private int coristasActivos = 0;

    public CoroPorHileras(String nombreCoro, Director director, int filas, int columnas, int cantCoristas) {
        super(nombreCoro, director);
        this.filas = filas;
        this.columnas = columnas;
        this.coristas = new Corista [this.filas][this.columnas];
        this.totalCoristas = this.filas * this.columnas;
        for (int i = 0; i < this.filas; i++) {
            for (int j = 0; j < this.columnas; j++) {
                this.coristas[i][j] = null;
            }
        }
    }

    @Override
    public void agregarCorista(Corista corista) {
        if (this.coristasActivos < this.totalCoristas) {
            this.coristas[this.coristasActivos/this.columnas][this.coristasActivos%this.columnas] = corista;
            this.coristasActivos++;
        } else {
            System.out.println("No hay mas lugar en el coro");
        }
    }

    @Override
    public boolean estaBienFormado() {
        int fila = 0;
        int columna = 0;
        boolean ok = true;
        while ((fila < this.filas-1) && (ok)) {
            columna = 0;
            while ((columna < this.columnas-1) && ok) {
                if (this.coristas[fila][0].getTono() < this.coristas[fila+1][0].getTono()) {
                    ok = false;
                }
                fila++;
            }
        }
        return ok;
    }

    @Override
    public boolean estaLleno() {
        boolean ok = false;
        if (this.coristasActivos == this.totalCoristas) {
            ok = true;
        }
        return ok;
    }

    @Override
    public String toString() {
        String aux;
        aux = super.toString() + "Datos de los coristas: \n";
        for (int i = 0; i < this.filas; i++) {
            for (int j = 0; j < this.columnas; j++) {
                if (this.coristas[i][j] != null) {
                    aux += this.coristas[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }
    
    
}
