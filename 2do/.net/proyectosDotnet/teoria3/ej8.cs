/* using  System.Double, System.Single, System.Single

8) object no cuenta con un método Length a diferencia de int[], error en tiempo de compilación
   dyna es un INT, y los INT no cuentan con un método Length, se producirá un error en tiempo de ejecución

9)
var a = 3L; //tipo long
dynamic b = 32;
object obj = 3;
a = a * 2.0; //se intenta hacer una multiplicación entre un tipo LONG y un DOUBLE, y la conversión implícita no se puede hacer
b = b * 2.0;
b = "hola"; //dynamic b ahora pasa a contener una referencia a un string inmutable
obj = b; //obj ahora contiene la referencia al string al que apunta b
b = b + 11; //como b es de tipo dynamic el compilador no tira error, pero esto va a tirar error en tiempo de ejecución ya que no se puede hacer
obj = obj + 11; //el compilador tira error porque no se puede hacer una suma entre string y tipo int
var c = new { Nombre = "Juan" }; //tipo anónimo
var d = new { Nombre = "María" };
var e = new { Nombre = "Maria", Edad = 20 };
var f = new { Edad = 20, Nombre = "Maria" };
f.Edad = 22; //esto no se puede hacer porque los tipos de dato anónimos solo le dan propiedades de solo lectura a las variables
d = c; //a d se le pasa la referencia del objeto al cual apunta c
e = d; //a e se le pasa la referencia del objeto al cual apunta d, pero esto no se puede hacer ya que los tipos de datos son diferentes en estructura
f = e; //pasa lo mismo con f, por mas que ambas variables contengan 2 propiedades

10) redondea

11) List<int> a = [ 1, 2, 3, 4 ];
a.Remove(5); //No hay un 5 en la lista, pero no tira error de ejecución
a.RemoveAt(a.Count - 1); //Error, no existe la posición 4 en la lista */