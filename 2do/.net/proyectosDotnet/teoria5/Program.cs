using teoria5;

// 1
/* Cuenta c1 = new Cuenta();
c1.Depositar(100).Depositar(50).Extraer(120).Extraer(50);
Cuenta c2 = new Cuenta();
c2.Depositar(200).Depositar(800);
new Cuenta().Depositar(20).Extraer(20);
c2.Extraer(1000).Extraer(1);
Console.WriteLine("\nDETALLE");
Cuenta.ImprimirDetalle(); */

// 2
/* new Cuenta2();
new Cuenta2();
List<Cuenta2> cuentas = Cuenta2.GetCuentas();
cuentas[0].Depositar(50);
cuentas.RemoveAt(0);
Console.WriteLine(cuentas.Count);
cuentas = Cuenta2.GetCuentas();
Console.WriteLine(cuentas.Count);
cuentas[0].Extraer(30); */

// 3
// Crear cuentas
var c1 = new Cuenta3();
var c2 = new Cuenta3();
// Realizar operaciones
c1.Depositar(1000).Extraer(300);
c2.Depositar(500).Extraer(700); // esto debería fallar
// Imprimir detalles generales
Cuenta3.ImprimirDetalle();
// Mostrar todas las cuentas
Console.WriteLine("\nListado de cuentas:");
foreach (var cuenta in Cuenta3.Cuentas) {
    Console.WriteLine(cuenta); // se llama automáticamente a ToString()
}