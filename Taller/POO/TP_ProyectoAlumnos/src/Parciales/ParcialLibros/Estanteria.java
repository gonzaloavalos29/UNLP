/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales.ParcialLibros;

/**
 *
 * @author Gonzalo
 */
public class Estanteria {
    
    private int cantEstantes; // Dimensión física de estantes (filas)
    private int cantLibros; // Dimensión física de libros (columnas)
    private Libro matriz_libros [][]; 

    public Estanteria(int cantEstantes, int cantLibros) {
        setCantEstantes(cantEstantes);
        setCantLibros(cantLibros);
        this.matriz_libros = new Libro[this.getCantEstantes()][this.getCantLibros()];
    }
    
    // Métodos que pide el inciso B

    public int getCantEstantes() {
        return cantEstantes;
    }

    public void setCantEstantes(int cantEstantes) {
        this.cantEstantes = cantEstantes;
    }

    public int getCantLibros() {
        return cantLibros;
    }

    public void setCantLibros(int cantLibros) {
        this.cantLibros = cantLibros;
    }
    
    public void almacenarLibro(Libro libro, int nroEstante, int nroLibro) { //Se asume que el lugar está disponible
        if (nroEstante < this.getCantEstantes() && nroLibro < this.getCantLibros()) {
            this.matriz_libros[nroEstante][nroLibro] = libro;
        } else {
            System.out.println("La posición de la matriz es inválida");
        }
    }
    
    public Libro sacarLibro(String unTitulo) {
        Libro libro_buscado = null;
        boolean encontrado = false;
        int i = 0, j = 0;
        while (i < this.getCantEstantes() && !encontrado) {
            while (j < this.getCantLibros() && !encontrado) {
                if (this.matriz_libros[i][j] != null) {
                    if (this.matriz_libros[i][j].getTitulo().equals(unTitulo)) {
                        libro_buscado = this.matriz_libros[i][j];
                        encontrado = true;
                        this.matriz_libros[i][j] = null;
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
        if (libro_buscado == null) {
            System.out.println("No se encontró el libro.");
        }
        return libro_buscado;
    }
    
    public Libro calcularLibroMasPesado() {
        Libro libroMasPesado = null;
        double maxPeso = -1;
        for (int i = 0; i < this.getCantEstantes(); i++) {
            for (int j = 0; j < this.getCantLibros(); j++) {
                if (this.matriz_libros[i][j] != null) {
                    if (this.matriz_libros[i][j].getPeso() > maxPeso) {
                        maxPeso = this.matriz_libros[i][j].getPeso();
                        libroMasPesado = this.matriz_libros[i][j];
                    }
                }
            }
        }
        System.out.println("El libro más pesado de la estantería es: " + maxPeso);
        return libroMasPesado;
    }
    
}
