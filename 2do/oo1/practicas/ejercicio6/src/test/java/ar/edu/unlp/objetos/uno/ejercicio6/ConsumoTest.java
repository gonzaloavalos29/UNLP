package ar.edu.unlp.objetos.uno.ejercicio6;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.objetos.uno.ejercicio6.Consumo;

public class ConsumoTest {
	private Consumo c1, c2;
	
	@BeforeEach
	public void setUp() {
		c1 = new Consumo(4, 3);
		c2 = new Consumo(3, 5);
	}
	
	@Test
	public void testBonificacion() {
		assertTrue(c1.hayBonificacion());
		assertFalse(c2.hayBonificacion());
	}
}
