package ar.edu.unlp.objetos.uno.ejercicio18;

import java.util.HashSet;

public class EvenNumberSet<Integer> extends HashSet<Integer> {
	
	@Override
	public boolean add(Integer num) {
		if ((int) num % 2 == 0) {
			return super.add(num);
		} else
			return false;
	}
	
	// La otra solución posible sería en vez de aplicar el abstractset de java y
	// redefinir el método add,
	// usar la interfaz de set y escribir todos los métodos de ésta, incluido el add
	// para que cumpla la funcionalidad esperada.
}

