/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author chach
 */
public class Alumno {
    
    private int dni;
    private String nombre;
    private Materia [] aprobadas;
    private int cantAprobadas;
    private int cantMax;

    public Alumno(int dni, String nom, int max) {
        this.dni = dni;
        this.nombre = nom;
        this.cantAprobadas = 0;
        this.cantMax = max;
        this.aprobadas = new Materia [cantMax];
    }
    
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantAprobadas() {
        return cantAprobadas;
    }

    public void setCantAprobadas(int cantAprobadas) {
        this.cantAprobadas = cantAprobadas;
    }

    public int getCantMax() {
        return cantMax;
    }

    public void setCantMax(int cantMax) {
        this.cantMax = cantMax;
    }

    public Materia[] getAprobadas() {
        return aprobadas;
    }

    public void setAprobadas(Materia[] aprobadas) {
        this.aprobadas = aprobadas;
    }
    
    public boolean hayEspacio() {
        return this.cantMax != this.cantAprobadas;
    }
    
    public void agregarMateria(Materia mat) {
        if (this.hayEspacio()) {
            this.aprobadas[this.cantAprobadas++] = mat;
        }
    }
    
    public boolean esGraduado() {
        int aux = 0;
        boolean es = false;
        String auxstr = "Tesis";
        if (this.cantAprobadas == this.cantMax) {
            while ((aux < this.cantAprobadas) && (es == false)) {
                if (this.aprobadas[aux].getNombre().equals(auxstr)) {
                    es = true;
                }
                aux++;
            }
        }
        return es;
    }
    
    private String Concatenador() {
        int i;
        String aux = "";
        for (i = 0; i < this.getCantAprobadas(); i++) {
            aux = aux + " " + this.aprobadas[i].toString();
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "DNI: " + this.getDni() + " | " + " Nombre: " + this.getNombre() + " | " + "\n" + " Materias aprobadas: " + this.cantAprobadas + "\n" + this.Concatenador() + " | " + "Es Graduado: " + this.esGraduado() + "\n";
        return aux;
    }
    
    
    
    
}
