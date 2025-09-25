package ar.edu.unlp.objetos.uno.ejercicio6;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.objetos.uno.ejercicio6.Consumo;
import ar.edu.unlp.objetos.uno.ejercicio6.CuadroTarifario;
import ar.edu.unlp.objetos.uno.ejercicio6.Factura;
import ar.edu.unlp.objetos.uno.ejercicio6.Usuario;

public class UsuarioTest {
	private Usuario usuario;
	
	@BeforeEach
	public void setUp() {
		usuario = new Usuario("Gonzalo", "111");
	}
	
	@Test
	public void testCrearFactura() {
		CuadroTarifario cuadro = new CuadroTarifario(100);
		assertNull(usuario.crearFactura(cuadro));
		usuario.agregarConsumo(new Consumo(4, 3));
		Factura f = usuario.crearFactura(cuadro);
		assertEquals(270, f.montoTotal());
	}
}
