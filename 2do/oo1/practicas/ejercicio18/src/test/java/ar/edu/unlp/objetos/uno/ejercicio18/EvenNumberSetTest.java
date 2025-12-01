package ar.edu.unlp.objetos.uno.ejercicio18;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EvenNumberSetTest {

	EvenNumberSet<Integer> set;
	
	@BeforeEach
	void setUp() {
		this.set = new EvenNumberSet<Integer>();
	}
	
	@Test
	void testAdd() {
		assertFalse(set.add(1));
		assertTrue(set.add(2));
		assertTrue(set.add(4));
		assertFalse(set.add(2));
	}
}
