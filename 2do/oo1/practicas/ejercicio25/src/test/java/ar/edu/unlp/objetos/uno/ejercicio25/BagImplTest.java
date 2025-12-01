package ar.edu.unlp.objetos.uno.ejercicio25;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BagImplTest {

	BagImpl<String> b;
	
	@BeforeEach
	void setUp() throws Exception {
		b = new BagImpl<String>();
	}
	
	@Test
	void testAdd() {
		assertEquals(true, b.add("Gonza"));
		assertEquals(true, b.add("Gonza"));
	}
	
	@Test
	void testOcurrenceOf() {
		assertEquals(0, b.occurrencesOf("Juan"));
		b.add("Gonza");
		assertEquals(1, b.occurrencesOf("Gonza"));
	}

	@Test
	void testRemoveAll() {
		b.add("Juan");
		b.add("Juan");
		b.add("Juan");
		b.removeAll("Juan");
		assertEquals(0, b.occurrencesOf("Juan"));
	}
	
	@Test
	void testRemoveOcurrence() {
		b.remove("Juan");
		assertEquals(0, b.occurrencesOf("Juan"));
	}
	
	@Test
	void testSize() {
		b.add("Juan");
		assertEquals(1, b.size());
		b.add("Juan");
		b.add("Gonza");
		assertEquals(3, b.size());
	}
}
