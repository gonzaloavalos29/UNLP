package tp1.Ej11;

//Clase que representa una parada
class Parada {
	 private String nombre;
	 private String direccion;
	
	 public Parada(String nombre, String direccion) {
	     this.nombre = nombre;
	     this.direccion = direccion;
	 }
	
	 @Override
	 public String toString() {
	     return nombre + " (" + direccion + ")";
	 }
}

