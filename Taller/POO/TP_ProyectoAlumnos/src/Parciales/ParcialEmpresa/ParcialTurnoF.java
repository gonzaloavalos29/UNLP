package Parciales.ParcialEmpresa;

public class ParcialTurnoF {

    public static void main(String[] args) {
        Director director = new Director("Ruperto", 1234, 2020, 10, 10);
        Empresa empr = new Empresa("Mercadolibre", "La Plata", director, 5);
        
        Encargado e1 = new Encargado("Ruffini", 123, 2000, 5, 5);
        Encargado e2 = new Encargado("Ruffe", 124, 2003, 6, 6);
        Encargado e3 = new Encargado("Ruffa", 125, 2015, 7, 7);
        
        empr.asignarEncargado(e1, 0);
        empr.asignarEncargado(e2, 1);
        empr.asignarEncargado(e3, 2);
        System.out.println(empr.toString());
    }
}