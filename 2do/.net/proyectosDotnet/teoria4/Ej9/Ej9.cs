/* ¿Qué se puede decir en relación a la sobrecarga de métodos en este ejemplo?
class A {
	public void Metodo(short n) {
		Console.Write("short {0} - ", n);
	}
	public void Metodo(int n) {
 		Console.Write("int {0} - ", n);
 	}
 	public int Metodo(int n) {
 		return n + 10;
 	}
} */

// NO COMPILA
// estás sobrecargando el método "Metodo", pero dos de las sobrecargas tienen la misma firma (mismo nombre, mismo parámetro).
// el compilador no los puede distinguir.
// se puede tener varios métodos con el mismo nombre, pero deben tener distinto número o tipo de parámetros.