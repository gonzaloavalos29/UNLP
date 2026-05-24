package tp1.Ej10;

//Cola del banco
import java.util.PriorityQueue;

public class ColaBanco {
 // Cola de prioridades que ordena por prioridad y luego por ticket
 private PriorityQueue<Cliente> cola;
 private int contadorTickets;

 public ColaBanco() {
     this.cola = new PriorityQueue<>();
     this.contadorTickets = 1;
 }

 // Agrega un cliente común a la cola
 public void agregarClienteComun(String nombre) {
     Cliente cliente = new Cliente(
         nombre,
         contadorTickets++,
         TipoPrioridad.COMUN
     );
     cola.add(cliente);
     System.out.println("✅ Se agregó: " + cliente);
 }

 // Agrega un cliente prioritario a la cola
 public void agregarClientePrioritario(String nombre) {
     Cliente cliente = new Cliente(
         nombre,
         contadorTickets++,
         TipoPrioridad.PRIORITARIO
     );
     cola.add(cliente);
     System.out.println("⭐ Se agregó (PRIORITARIO): " + cliente);
 }

 // Atiende al siguiente cliente
 public void atenderSiguiente() {
     if (cola.isEmpty()) {
         System.out.println("❌ No hay clientes en la cola.");
         return;
     }
     Cliente atendido = cola.poll();
     System.out.println("🔔 Atendiendo: " + atendido);
 }

 // Muestra el estado de la cola
 public void mostrarCola() {
     if (cola.isEmpty()) {
         System.out.println("La cola está vacía.");
         return;
     }
     System.out.println("Estado actual de la cola:");
     // Copiamos para no modificar la cola original
     PriorityQueue<Cliente> copia = new PriorityQueue<>(cola);
     while (!copia.isEmpty()) {
         System.out.println("  → " + copia.poll());
     }
 }

 // Main de prueba
 public static void main(String[] args) {
     ColaBanco banco = new ColaBanco();

     System.out.println("=== Simulación Cola del Banco ===\n");

     // Llegan clientes en orden
     banco.agregarClienteComun("Juan Pérez");
     banco.agregarClienteComun("María García");
     banco.agregarClientePrioritario("Ana López (embarazada)");
     banco.agregarClienteComun("Carlos Ruiz");
     banco.agregarClientePrioritario("Don Alberto (75 años)");

     System.out.println("\n--- Estado de la cola ---");
     banco.mostrarCola();

     System.out.println("\n--- Atendiendo clientes ---");
     banco.atenderSiguiente(); // Debe atender a Ana (prioritaria, ticket 3)
     banco.atenderSiguiente(); // Debe atender a Don Alberto (prioritario, ticket 5)
     banco.atenderSiguiente(); // Debe atender a Juan (común, ticket 1)
     banco.atenderSiguiente(); // Debe atender a María (común, ticket 2)
     banco.atenderSiguiente(); // Debe atender a Carlos (común, ticket 4)
     banco.atenderSiguiente(); // Cola vacía
 }
}
