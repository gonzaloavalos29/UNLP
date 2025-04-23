package Practica1.Ej7;

import java.util.*;

import Practica1.Ej3.Estudiante;

public class TestArrayList {
    public static void main(String[] args) {
        // INCISO A
        // List <Integer> listasNums = new ArrayList <Integer>();
        
        // INCISO B
        // La diferencia esta en el acceso a esos numeros, en el ArrayList es directo mientras que en la lista enlazada es más ineficiente ya que se debe recorrer de forma secuencial.
        // Además ArrayList necesita un espacio continuo de memoria para guardar datos mientras que LinkedList enlaza nodos con punteros y no requiere espacio continuo de memoria
        List <Integer> listaNums = new LinkedList<Integer>();
        for (int i = 0; i < args.length; i++)
            listaNums.add(Integer.parseInt(args[i]));
        System.out.println("Elementos insertados: " + listaNums.size());
        
        // INCISO C
        for (int i: listaNums)
            System.out.println(i);
        
        System.out.println("-------------");
        
        Iterator<Integer> it = listaNums.iterator();
        while (it.hasNext())
            System.out.println(it.next());
        
        System.out.println("-----------------");
        
        for (int i = 0; i < listaNums.size(); i++)
            System.out.println("Num=" + listaNums.get(i));
        
        // INCISO D
        List <Estudiante> listaEsts = new LinkedList <Estudiante>();
        Estudiante e1 = new Estudiante("Avalos", "Matias", "gonzalo0avalos@gmail.com", "b", "Facultad de Informática");
        listaEsts.add(e1);
        Estudiante e2 = new Estudiante("Lima", "Francisco", "gonzalo0avalos@gmail.com", "b", "Facultad de Informática");
        listaEsts.add(e2);
        Estudiante e3 = new Estudiante("Fischer", "Matias", "gonzalo0avalos@gmail.com", "b", "Facultad de Informática");
        listaEsts.add(e3);
        System.out.println("Estudiantes de la Facultad de Informática: ");
        for (Estudiante est: listaEsts)
            System.out.println(est.toString());
        
        List <Estudiante> listaEstsCopiados = new LinkedList <Estudiante>(listaEsts); // crea una copia independiente del original
        System.out.println("Estudiantes copiados: ");
        System.out.println(listaEstsCopiados);
        
        System.out.println("===============");
        
        // e1.setNombre("Matute"); Se modifica en todas las listas, porque se copian las direcciones a los objetos y lo que se modificó el objeto
        listaEsts.set(0, new Estudiante("Prueba", "Prueba", "pruebamail", "b", "Facultad de Informática"));
        System.out.println("Estudiantes: ");
        for (Estudiante est: listaEsts)
            System.out.println(est.toString()); // en este caso este cambio solo se ve en esta lista y no en la copiada, porque se cambió la referencia al objeto Estudiante
        
        List <Estudiante> listaEstsCopiados1 = new LinkedList <Estudiante>(listaEsts); // crea una copia independiente del original
        System.out.println("Estudiantes copiados: ");
        System.out.println(listaEstsCopiados1);
        
        System.out.println("================");
        
        // e1.setNombre("Matute"); Se modifica en todas las listas, porque se copian las direcciones a los objetos y lo que se modificó fue el objeto
        listaEsts.set(0, new Estudiante("Prueba", "Prueba", "pruebamail", "b", "Facultad de Informatica"));
        System.out.println("Estudiantes: ");
        for (Estudiante est: listaEsts)
            System.out.println(est.toString()); // en este caso este cambio solo se ve en esta lista y no en la copiada, porque se cambio la referencia al objeto Estudiante
        System.out.println("Estudiantes copiadas: ");
        System.out.println(listaEstsCopiados1);
        
        System.out.println("=================");
        
        // Otra forma de copiar una lista es con el método addAll(): crear un nuevo LinkedList y agregar todos los elementos del original usando este método
        List <Estudiante> listaEstsCopiadosAdd = new LinkedList <Estudiante>();
        listaEstsCopiadosAdd.addAll(listaEsts);
        System.out.println("Estudiantes copiados v2: ");
        System.out.println(listaEstsCopiadosAdd);
        
        System.out.println("=================");
        
        // INCISO E
        Estudiante e4 = new Estudiante("Guerrero", "Justina", "justimail", "b", "Facultad de Informatica");
        if (!listaEsts.contains(e4)) {
            listaEsts.add(e4);
            System.out.println("Se agregó al alumno correctamente");
        } else {
            System.out.println("El alumno se encuentra repetido");
        }
        System.out.println("Listado con alumnos: ");
        System.out.println(listaEsts);
    }
}
