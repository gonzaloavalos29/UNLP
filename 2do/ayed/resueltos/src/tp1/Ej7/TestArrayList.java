package tp1.Ej7;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class TestArrayList {

	public static void main(String[] args) {
		// INCISO A
		// List <Integer> listaNums = new ArrayList <Integer>();
		
		/*
		 * INCISO B La diferencia esta en el acceso a esos numeros, en el ArrayList es
		 * directo mientras que en la lista enlazada el acceso es mas ineficiente ya que
		 * se debe recorrer de forma secuencial. Ademas ArrayList necesita un espacio
		 * continuo de memoria para guardar datos mientras que LinkedList enlaza nodos
		 * con punteros y no requiere espacio continuo de memoria. List<Integer>
		 * listaNums = new LinkedList <Integer>();
		 */
		List <Integer> listaNums = new LinkedList <Integer>();
		for (int i = 0; i < args.length; i++)
			listaNums.add(Integer.parseInt(args[i]));
		System.out.println("Elementos insertados: " + listaNums.size());
		
		// INCISO C
		for (int i1: listaNums) {
			System.out.println(i1);
		}
			
		System.out.println("------");
		
		Iterator<Integer> it = listaNums.iterator();
		while (it.hasNext())
			System.out.println(it.next());
		
		System.out.println("------");
		
		for (int i = 0; i < listaNums.size(); i++) 
			System.out.println("Num=" + listaNums.get(i));
		
		// INCISO D
		List <Estudiante> listaEsts = new LinkedList <Estudiante>();
		Estudiante e1 = new Estudiante("Avalos", "Gonzalo", "gonzalo0avalos@gmail.com", "Facultad de Informatica");
		listaEsts.add(e1);
		Estudiante e2 = new Estudiante("Arque", "Inaki", "inakimail", "Facultad de Informatica");
		listaEsts.add(e2);
		Estudiante e3 = new Estudiante("Marchetta", "Lucas", "lucasmail", "Facultad de Informatica");
		listaEsts.add(e3);
		System.out.println("Estudiantes de la Facultad de Informatica");
		for (Estudiante est: listaEsts)
			System.out.println(est.toString());
		
		List<Estudiante> listaEstsCopiados = new LinkedList <Estudiante> (listaEsts); // crea una copia independiente del original
		System.out.println("Estudiantes copiados: ");
		System.out.println(listaEstsCopiados);
		
		System.out.println("=================");
		
		e1.setNombre("Carlos"); // Se modifica en todas las listas porque se copian las direcciones a los objetos y lo que se modifico fue el objeto
		listaEsts.set(0, new Estudiante("Prueba", "Prueba", "pruebamail", "Facultad de Informatica"));
		System.out.println("Estudiantes: ");
		for (Estudiante est: listaEsts)
			System.out.println(est.toString()); // En este caso este cambio solo se ve en esta lista y no en la copiada, porque se cambio la referencia al objeto estudiante
		System.out.println("Estudiantes copiados: ");
		System.out.println(listaEstsCopiados);
		
		System.out.println("=====================");
		
		// Otra forma de copiar una lista e scon el metodo addAll(): Crear un nuevo LinkedList y agregar todos los elementos del original usando este metodo
		List<Estudiante> listaEstsCopiadosAdd = new LinkedList<Estudiante>();
		listaEstsCopiadosAdd.addAll(listaEsts);
		System.out.println("Estudiantes copiados V2: ");
		System.out.println(listaEstsCopiadosAdd);
		
		System.out.println("=====================");
		
		// INCISO E
		Estudiante e4 = new Estudiante("Candela", "Franco", "francomail", "Facultad de Informatica");
		if (!listaEsts.contains(e4)) {
			listaEsts.add(e4);
			System.out.println("Se agrego al alumno correctamente");
		} else {
			System.out.println("El alumno se encuentra repetido");
		}
		System.out.println("Listado con alumnos: ");
		System.out.println(listaEsts);
	}
}
