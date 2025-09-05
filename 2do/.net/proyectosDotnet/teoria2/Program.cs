using System;
using System.Text;

// 1
/* object o1 = "A";
object o2 = o1;
o2 = "Z"; // no modifica el objeto original, sino que crea uno nuevo y reasigna la referencia de o2.
System.Console.WriteLine(o1 + " " + o2); */
// En este ejemplo, o1 y o2 son variables de tipo referencia, por lo que inicialmente ambas apuntan al mismo objeto en el heap.

// 2
/*
Las conversiones boxing y unboxing ocurren cuando se envuelve o se desempaqueta un valor tipo primitivo dentro de un objeto. En C#, los tipos primitivos como char, int, bool y otros se pueden "encapsular" en un object (boxing) y luego extraer de nuevo (unboxing). */
/* char c1 = 'A'; 
string st1 = "A";
object o1 = c1; // boxing
object o2 = st1; // (string es una referencia)
char c2 = (char)o1; // unboxing
string st2 = (string)o2; // es una conversión de referencia */
//

// 3
// En C#, la conversión implícita ocurre automáticamente cuando no hay riesgo de pérdida de datos, por ejemplo, al convertir de int a double. La conversión explícita requiere un casteo manual porque puede haber pérdida de datos, como al convertir de double a int.

// 4
/* object o = "Hola Mundo!";
string st = o as string;
int i = 12;
byte b = (byte)i;
double d = i;
float f = (float)d;
o = i;
i = (int)o + 1; */

// 5 = 2

// 6
/* int i;
Console.WriteLine(i); */
// no funciona ya que i no está inicializado

// 7
/* char c1 = 'A';
char c2 = 'A';
Console.WriteLine(c1 == c2);
object o1 = c1;
object o2 = c2;
Console.WriteLine(o1 == o2); */
// la 3ra y 6ta línea producen resultados diferentes ya que en el primer caso, son dos tipos primitivos (pasaje por valor) y en el segundo son dos objetos, los cuales están pasados por referencia, cada objeto es distinto y apunta a una dirección de memoria distinta.

// 8
/* StringBuilder myString = new StringBuilder("Una secuencia de numeros: ");
int i = 0;
while (i < 100)
{
    myString.Append(i.ToString() + "");
    i++;
}
Console.WriteLine(myString); */

// 9

DateTime tiempoActual = DateTime.Now;
StringBuilder myString = new StringBuilder("Una secuencia de numeros: ");
int i = 0;

while (i < 100) {
    myString.append(i.toString() + "");
    i++;
}

DateTime tiempoActual2 = DateTime.Now;
TimeSpan tiempoDiferencia = tiempoActual2 - tiempoActual;

Console.WriteLine("El programa comenzó a ejecutarse a las: " + tiempoActual);
Console.WriteLine("El programa terminó a las: " + tiempoActual2);
Console.WriteLine("En total se tardó: " + tiempoDiferencia.toString());