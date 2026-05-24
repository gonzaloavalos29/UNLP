package tp1.Ej10;

//Clase que representa a un cliente
public class Cliente implements Comparable<Cliente> {
	 private String nombre;
	 private int numeroTicket;
	 private TipoPrioridad prioridad;
	
	 public Cliente(String nombre, int numeroTicket, TipoPrioridad prioridad) {
	     this.nombre = nombre;
	     this.numeroTicket = numeroTicket;
	     this.prioridad = prioridad;
	 }
	
	 @Override
	 public int compareTo(Cliente otro) {
	     // Primero comparamos por prioridad
	     int cmp = Integer.compare(
	         this.prioridad.getValor(),
	         otro.prioridad.getValor()
	     );
	     // Si igual prioridad, respetamos orden de llegada (ticket)
	     if (cmp == 0) {
	         return Integer.compare(this.numeroTicket, otro.numeroTicket);
	     }
	     return cmp;
	 }
	
	 @Override
	 public String toString() {
	     return "Ticket #" + numeroTicket
	          + " | Nombre: " + nombre
	          + " | Prioridad: " + prioridad;
	 }
	
	 // Getters
	 public String getNombre()        { return nombre; }
	 public int getNumeroTicket()     { return numeroTicket; }
	 public TipoPrioridad getPrioridad() { return prioridad; }
}