package tp1.Ej10;

//Enumeración de tipos de prioridad
enum TipoPrioridad {
 PRIORITARIO(1),   // Mayor prioridad
 COMUN(2);         // Menor prioridad

 private final int valor;

 TipoPrioridad(int valor) {
     this.valor = valor;
 }

 public int getValor() {
     return valor;
 }
}
