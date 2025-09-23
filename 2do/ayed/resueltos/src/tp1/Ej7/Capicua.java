package tp1.Ej7;

import java.util.ArrayList;
import java.util.List;

public class Capicua {

	// 1ra forma
	public boolean esCapicua(ArrayList<Integer> lista) {
		boolean es = true;
		if (!lista.isEmpty()) {
			int pri = 0;
			int ult = lista.size() - 1;
			while ((pri < ult) && es) {
				if (lista.get(pri).equals(lista.get(ult))) {
					pri++;
					ult--;
				} else 
					es = false;
			}
		}
		return es;
	}
	
	// 2da forma
	public static boolean esPalindromo(List<Integer> lista) {
		if (lista.isEmpty() || lista.size() == 1) return true;
		else
			if (!lista.get(0).equals(lista.get(lista.size()-1))) return false; // si los primeros y los últimos elementos no coinciden, no es palindromo
			else
				return esPalindromo(lista.subList(1, lista.size()-1)); // llama recursivamente a esPalindromo con una subLista sin los primeros y los últimos elementos
	}
	
	private boolean esCapicua(ArrayList<Integer> lista, int pri, int ult) {
		boolean es = true;
		if (pri < ult)
			if (lista.get(pri).equals(lista.get(ult)))
				es = esCapicua(lista, ++pri, --ult);
			else
				es = false;
		return es;
	}
	
	// 3ra forma
	public boolean esCapicuaRec(ArrayList<Integer> lista) {
		if (!lista.isEmpty() && lista.size() > 1)
			return esCapicua(lista, 0, lista.size()-1);
		return true;
	}
	
	public static void main(String[] args) {
		ArrayList<Integer> lista = new ArrayList<Integer>();
		// Funciona porque el primer numero es igual al tercero, siendo palindromo
//		lista.add(200);
//		lista.add(5);
//		lista.add(200);
//		lista.add(5);
//		lista.add(200);
		
		// Seria numero 2442, palindromo
		lista.add(2);
		lista.add(4);
		lista.add(4);
		lista.add(2);
		
		// Seria numero 123, no es palindromo
//		lista.add(1);
//		lista.add(2);
//		lista.add(3);
		
		Capicua c = new Capicua();
		System.out.println("Es capicua: " + c.esCapicua(lista));
		System.out.println("Es capicua: " + c.esCapicuaRec(lista));
		System.out.println("Es capicua: " + esPalindromo(lista));
		
	}
	
}
