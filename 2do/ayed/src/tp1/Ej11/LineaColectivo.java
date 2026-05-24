package tp1.Ej11;

import java.util.LinkedList;

//Cola Circular que modela el recorrido de una línea
public class LineaColectivo {
	 private LinkedList<Parada> paradas;
	 private String numeroLinea;
	
	 public LineaColectivo(String numeroLinea) {
	     this.paradas = new LinkedList<>();
	     this.numeroLinea = numeroLinea;
	 }
	
	 // Agrega una parada al recorrido
	 public void agregarParada(Parada parada) {
	     paradas.addLast(parada);
	 }
	
	 // Avanza a la siguiente parada (comportamiento circular)
	 public Parada siguienteParada() {
	     if (paradas.isEmpty()) {
	         throw new IllegalStateException("No hay paradas en la línea.");
	     }
	     // La parada actual va al final (comportamiento circular)
	     Parada actual = paradas.removeFirst();
	     paradas.addLast(actual);
	     return actual;
	 }
	
	 // Muestra la parada actual sin avanzar
	 public Parada paradaActual() {
	     if (paradas.isEmpty()) {
	         throw new IllegalStateException("No hay paradas en la línea.");
	     }
	     return paradas.getFirst();
	 }
	
	 // Muestra todas las paradas del recorrido
	 public void mostrarRecorrido() {
	     System.out.println("Recorrido Línea " + numeroLinea + ":");
	     for (int i = 0; i < paradas.size(); i++) {
	         System.out.println("  Parada " + (i + 1) + ": " + paradas.get(i));
	     }
	 }
	
	 // Main de prueba
	 public static void main(String[] args) {
	     LineaColectivo linea273 = new LineaColectivo("273");
	
	     // Agregamos paradas
	     linea273.agregarParada(new Parada("Plaza Moreno",    "Calle 12 y 50"));
	     linea273.agregarParada(new Parada("Hospital Rossi",  "Calle 37 y 116"));
	     linea273.agregarParada(new Parada("Terminal",        "Calle 42 y 4"));
	     linea273.agregarParada(new Parada("Facultad de Inf", "Calle 50 y 120"));
	
	     System.out.println("=== Simulación Línea 273 ===\n");
	     linea273.mostrarRecorrido();
	
	     System.out.println("\n--- Simulando recorrido (2 vueltas) ---");
	     // Simulamos 8 paradas (2 vueltas completas)
	     for (int i = 0; i < 8; i++) {
	         Parada p = linea273.siguienteParada();
	         System.out.println("🚌 Parada actual: " + p);
	     }
	 }
}
