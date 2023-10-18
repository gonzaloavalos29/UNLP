/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso.Ejercicio2;

/**
 *
 * @author Gonzalo
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    
    private int nroPisos;
    private int nroPlazas;
    private Auto[][] matriz_autos;
    
    // Constructor

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8.00";
        this.horaCierre = "21.00";
        this.nroPisos = 5;
        this.nroPlazas = 10;
        this.matriz_autos = new Auto [this.nroPisos][this.nroPlazas];
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int nroPisos, int nroPlazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.nroPisos = nroPisos;
        this.nroPlazas = nroPlazas;
        this.matriz_autos = new Auto [nroPisos][nroPlazas];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getNroPisos() {
        return nroPisos;
    }

    public void setNroPisos(int nroPisos) {
        this.nroPisos = nroPisos;
    }

    public int getNroPlazas() {
        return nroPlazas;
    }

    public void setNroPlazas(int nroPlazas) {
        this.nroPlazas = nroPlazas;
    }
    
    // Otros métodos
    public void insertarAuto(Auto unAuto, int posPiso, int posPlaza) {
        this.matriz_autos[posPiso][posPlaza] = unAuto; // Se asume que el lugar está vacío
    }
    
    public String buscarAutoPorPatente(String patente) {
        String aux = "";
        int posPiso = -1, posPlaza = -1;
        boolean encontrado = false;
        int i = 0, j = 0;
        while (i < this.nroPisos && !encontrado) {
            while (j < this.nroPlazas && !encontrado) {
                if (this.matriz_autos[i][j] != null) {
                    if (this.matriz_autos[i][j].getPatente().equals(patente)) {
                        encontrado = true;
                        posPiso = i;
                        posPlaza = j;
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
        if (encontrado) {
            aux = "El auto de patente " + patente + " se encuentra en el piso " + (posPiso+1) + ", plaza " + (posPlaza+1);
        } else {
            aux = "Auto Inexistente";
        }
        return aux;
    }
    public int numAutosPorPlaza(int numPlaza) {
        int cont = 0;
        for (int i = 0; i < this.nroPisos; i++) { // Teniendo en cuenta todos los pisos
            if (this.matriz_autos[i][numPlaza] != null) // Registrar el número de autos ubicados en numPlaza
                cont++; // Si la plaza está ocupada, entonces incrementar el contador
        }
        return cont;
    }
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.nroPisos; i++) {
            for (int j = 0; j < this.nroPlazas; j++) {
                aux = aux + "Piso " + (i+1) + " Plaza " + (j+1) + " ";
                if (this.matriz_autos[i][j] != null) {
                    aux = aux + this.matriz_autos[i][j].toString() + " ";
                } else {
                    aux = aux + "libre ";
                }
            }
            aux = aux + "\n"; // Dejar una línea
        }
        return aux;
    }
}
