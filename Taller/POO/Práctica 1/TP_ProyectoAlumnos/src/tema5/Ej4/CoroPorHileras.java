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
    private int cantColumna = 0;
    private int cantFila = 0;

    public CoroPorHileras(String nombreCoro, Director director, int cantCoristas) {
        super(nombreCoro, director, cantCoristas);
        coristas = new Corista[cantCoristas/5][5]; // las columnas serán de a 5 coristas. La cantidad total viene determinada desde la superclase, por lo tanto dividimos la cantidad total por 5 para ver la cantidad de filas
    }

    @Override
    public void agregarCorista(Corista corista) {
        if (super.getCantActual() < super.getCantCoristas()) {
            this.coristas[this.cantFila][this.cantColumna] = corista;
            super.setCantActual(super.getCantActual()+1); this.cantColumna++;
            if (this.cantColumna == 5) {
                this.cantFila++;
                this.cantColumna = 0;
            }
        }
    }

    @Override
    public boolean estaBienFormado() {
        boolean aux = true;
        int i = 0, j = 0, contador = 0;
        while (contador < super.getCantActual() && aux == true){
            if (coristas[i][j+1].getTono() > coristas[i][j].getTono()) {
                aux = false;
            } else {
                j++;
            }
            if (j == 5) {
                i++;
                j = 0;
            }
            contador++;
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        for (int i = 0; i < super.getCantActual()/5; i++) {
            for (int j = 0; j < 5; j++) {
                aux += coristas[i].toString() + "\n";
            }
        }
        return aux;
    }
}
