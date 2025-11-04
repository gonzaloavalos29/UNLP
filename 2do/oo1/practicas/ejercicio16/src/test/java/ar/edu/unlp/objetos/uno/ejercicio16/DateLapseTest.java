package ar.edu.unlp.objetos.uno.ejercicio16;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DateLapseTest {
	Date periodo;
	LocalDate desde = LocalDate.of(2024, 5, 1);
	LocalDate hasta = LocalDate.of(2024, 5, 30);
	
	Date periodo2;
	LocalDate desde2 = LocalDate.of(2024, 4, 15);
	LocalDate hasta2 = LocalDate.of(2024, 5, 25);
	
	@BeforeEach
	void setUp() throws Exception {
		periodo = new DateLapse(desde, hasta);
		periodo2 = new DateLapse2(desde2, 10);
	}
	
	@Test
	public void testCantidadDias() {
		assertEquals(29, periodo.sizeInDays());
		assertEquals(10, periodo2.sizeInDays());
	}
	
	@Test
	public void testContieneFecha() {
		assertTrue(periodo.includesDate(desde));
		assertTrue(periodo.includesDate(hasta));
		assertTrue(periodo.includesDate(desde));
		assertTrue(periodo.includesDate(hasta2));
	}
}
