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
public class CoroHileras extends Coro {
    
    private int dimL_F;
    private int dimL_C;
    private Corista [][] matriz_coristas;
    private int [] vec_matriz; // Un vector para almacenar los índices de cada columna
    private int vec_indice = 0;
    
    public CoroHileras(Director director, int cantFilas, int cantColumnas) {
        super(director, cantFilas, cantColumnas);
        this.dimL_F = this.getCantFilas();
        this.dimL_C = this.getCantColumnas();
        //System.out.println(this.dimL_C);
        this.matriz_coristas = new Corista [this.dimL_F][this.dimL_C];
        
        // Inicializar la matriz en todos ceros
        this.vec_matriz = new int [this.dimL_F];
        for (int i = 0; i < this.dimL_F; i++)
            this.vec_matriz[i] = 0;
    }

    @Override
    public void agregarCorista(Corista nuevoCorista) {
       if (this.vec_indice < this.dimL_F) {
           if (this.vec_matriz[this.vec_indice] < this.dimL_C) {
               this.matriz_coristas[this.vec_indice][this.vec_matriz[this.vec_indice]] = nuevoCorista;
               this.vec_matriz[this.vec_indice]++;
               if (this.vec_matriz[this.vec_indice] == this.dimL_C)
                   this.vec_indice++;
           }
       }
    }

    @Override
    public boolean estaLleno() {
        return (this.vec_indice == dimL_F);
    }

    @Override
    public boolean estaBienFormado() {
        boolean aux = true;
        int i = 0, j = 0, valColPas = 0, valColAct, valPriAct, valPriPas = 9999;
        while (i <= this.vec_indice && this.vec_matriz[this.vec_indice] > 0 && aux) {
            valPriAct = this.matriz_coristas[i][j].getTonoFundamental();
            valColPas = valPriAct; // Asignarle el mismo valor para iterar bien el segundo while
            if (valPriAct >= valPriPas)
                aux = false;
            while (j < this.vec_matriz[i] && aux) {
                valColAct = this.matriz_coristas[i][j].getTonoFundamental();
                if (valColAct != valColPas)
                    aux = false;
                valColPas = valColAct;
                j++;
            }
            j = 0;
            valPriPas = valPriAct; // Asigno a valPriPas el valor de valPriAct para llevar el registro
            i++;
        }
        return aux;
    }

    @Override
    public String mostrarCoristas() {
        String aux = "";
        for (int i = 0; i <= this.vec_indice; i++) {
            for (int j = 0; j < this.vec_matriz[i]; j++) {
                aux = aux + this.matriz_coristas[i][j].toString() + "\n";
            }
        }
        return aux;
    }
}
