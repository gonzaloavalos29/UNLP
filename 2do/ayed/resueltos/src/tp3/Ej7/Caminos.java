/* Ejercicio 7
Dada una clase Caminos que contiene una variable de instancia de tipo GeneralTree de números
enteros, implemente un método que retorne el camino a la hoja más lejana. En el caso de haber
más de un camino máximo retorne el primero que encuentre.
El método debe tener la siguiente firma: public List<Integer> caminoAHojaMasLejana ()
Por ejemplo, para el siguiente árbol, la lista a retornar seria: 12, 17, 6, 1 de longitud 3
(Los caminos 12, 15, 14, 16 y 12, 15, 14, 7 son también máximos, pero se pide el primero). */

package tp3.Ej7;

import java.util.LinkedList;
import java.util.List;

import tp3.Ej1y3y5.GeneralTree;

public class Caminos {
	private GeneralTree<Integer> ab;
	
	public Caminos(GeneralTree<Integer> ab) {
		this.ab = ab;
	}
	
	public List<Integer> caminoAHojaMasLejana() {
		List<Integer> camAct = new LinkedList<Integer>();
		List<Integer> camMax = new LinkedList<Integer>();
		if (!ab.isEmpty()) caminoHelper(ab, camAct, camMax);
		return camMax;
	}
	
	private void caminoHelper(GeneralTree<Integer> a, List<Integer> camAct, List<Integer> camMax) {
		camAct.add(a.getData());
		if (!a.isLeaf()) {
			for (GeneralTree<Integer> h: a.getChildren()) {
				caminoHelper(h, camAct, camMax);
			}
		} else if (camAct.size() > camMax.size()) {
			camMax.removeAll(camMax);
			camMax.addAll(camAct);
		}
		camAct.remove(camAct.size()-1);
	}
	
}
