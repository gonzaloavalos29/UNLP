package ar.edu.unlp.objetos.uno.ejercicio13;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class InversorTest {
	private Inversor inversor;
	private InversionEnAcciones accion;
	private PlazoFijo plazoFijo;

	@BeforeEach
	void setUp() {
		inversor = new Inversor("Gonzalo");
		accion = new InversionEnAcciones("Crypto", 10, 100);
		plazoFijo = new PlazoFijo(LocalDate.of(2025, 10, 15), 100, 10);
	}

	@Test
	void testInversionEnAcciones() {
		assertEquals(1000, accion.valorActual());
	}
	
	@Test
	void testPlazoFijo() {
		assertEquals(1100, plazoFijo.valorActual());
	}
	
	@Test
	void testInversor() {
		assertEquals(0, inversor.valorActual());
		inversor.agregarInversion(accion);
		inversor.agregarInversion(plazoFijo);
		assertEquals(2100, inversor.valorActual());
	}
}
