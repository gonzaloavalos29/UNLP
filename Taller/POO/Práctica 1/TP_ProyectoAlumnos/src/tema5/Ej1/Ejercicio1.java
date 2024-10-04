/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.Ej1;

/**
 *
 * @author chach
 */
public class Ejercicio1 {
    public static void main(String[] args) {
        Proyecto p = new Proyecto("ARCOR", 111, "GonzaloAvalos");
        Investigador i1 = new Investigador("Leonardo", 1, "Dulces");
        Investigador i2 = new Investigador("Dolores", 2, "Dulces");
        Investigador i3 = new Investigador("Juan", 2, "Dulces");
        p.agregarInvestigador(i1);
        p.agregarInvestigador(i2);
        p.agregarInvestigador(i3);
        i1.agregarSubsidio(new Subsidio(1000, "Dolor"));
        i1.agregarSubsidio(new Subsidio(2000, "Lastimaduras"));
        i2.agregarSubsidio(new Subsidio(1000, "Dolor"));
        i2.agregarSubsidio(new Subsidio(2000, "Lastimaduras"));
        i3.agregarSubsidio(new Subsidio(1000, "Dolor"));
        i3.agregarSubsidio(new Subsidio(2000, "Lastimaduras"));
        p.otorgarTodos("Leonardo");
        System.out.println(p.toString());
    }
}
