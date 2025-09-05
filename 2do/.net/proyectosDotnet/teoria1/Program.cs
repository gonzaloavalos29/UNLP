using System;

// See https://aka.ms/new-console-template for more information
System.Console.WriteLine("Hello, World!");

// 1
/* Console.Write("HOLA");
Console.Write("HOLA MUNDO"); */

// 2
/* Console.WriteLine("\n");
Console.WriteLine("\t");
Console.WriteLine("\""); */

// 3
/* string st = @"c:\windows\system";
Console.WriteLine(st); */

// 4
/* Console.WriteLine("Ingrese su nombre: ");
string nombre = Console.ReadLine();
if (nombre == "") {
    Console.WriteLine("Hola Mundo");
} else {
    Console.WriteLine("Hola... " + nombre);
} */

// 5
/* Console.WriteLine("Ingrese su nombre: ");
string nombre = Console.ReadLine();
switch (nombre) {
    case "Juan":
        Console.WriteLine("¡Hola amigo!");
        break;
    case "María":
        Console.WriteLine("Buen día señora");
        break;
    case "Alberto":
        Console.WriteLine("Hola Alberto");
        break;
    default:
        Console.WriteLine("Buen día");
        break;
} */

// 6
/* class Program {
    static void Main() {
        while (true) {
            string? input = Console.ReadLine();
            if (string.IsNullOrEmpty(input))
                break;

            Console.WriteLine(input.Length);
            Console.WriteLine(input);
        }
    }
} */

// 7
/* Console.WriteLine("100".Length); */ // imprime 3

// 8
/* string? st = "";
Console.WriteLine(st=Console.ReadLine()); */
// es válida en C#, pero no es una práctica recomendada en términos de claridad y legibilidad del código.
 // Para mejorar la legibilidad, se recomienda separar la asignación y la impresión.

// 9
/* class Program {
    static void Main() {
        Console.WriteLine("Ingrese dos palabras separadas por un espacio:");
        string? input = Console.ReadLine();

        // separar las palabras
        string[] palabras = input.Split(' ');

        // Verificar que haya exactamente dos palabras
        if (palabras.Length != 2) {
            Console.WriteLine("Debe ingresar exactamente dos palabras separadas por un espacio.");
            return;
        }

        string palabra1 = palabras[0];
        string palabra2 = palabras[1];

        // Invertir la segunda palabra
        char[] palabra2Invertida = palabra2.ToCharArray();
        Array.Reverse(palabra2Invertida);
        string palabra2Reversa = new string(palabra2Invertida);

        // Comparar si son iguales
        if (palabra1 == palabra2Reversa) {
            Console.WriteLine("Las palabras son simétricas.");
        } else {
            Console.WriteLine("Las palabras no son simétricas");
        }
    }
} */

// 10
/* class Program {
    static void Main() {
        Console.WriteLine("Múltiplos de 17 o de 19 entre 1 y 1000:");
        for (int i = 1; i <= 1000; i++) {
            if (i % 17 == 0 || i % 29 == 0) {
                Console.WriteLine(i);
            }
        }
    }
} */

// 11
/* class Program
{
    static void Main()
    {
        Console.WriteLine("10/3 = " + 10 / 3);
        Console.WriteLine("10.0/3 = " + 10.0 / 3);
        Console.WriteLine("10/3.0 = " + 10 / 3.0);

        int a = 10, b = 3;
        Console.WriteLine("Si a y b son variables enteras, si a=10 y b=3");
        Console.WriteLine("entonces a/b = " + a / b);

        double c = 3;
        Console.WriteLine("Si c es una variable double, c=3");
        Console.WriteLine("entonces a/c = " + a / c);
    }
} */

// a) Cuando ambos operandos son enteros (int), la divisón / realiza una división entera, descartando la parte decimal. (ejemplo 10 / 3 = 3)
// si uno de los operandos es double, la división es de punto flotante y conserva los decimales.
// cuando se divide un entero por un double, el entero se convierte implícitamente en double y se realiza una división en coma flotante.
// b) El operador + entre un string y un dato numérico genera que el número se convierta automáticamente a cadena (string) antes de la concatenación.

// 12
/* class Program
{
    static void Main()
    {
        Console.Write("Ingrese un número entero: ");
        string st = Console.ReadLine(); // Leer el número como string
        int numero = int.Parse(st); // Convertirlo a entero

        Console.WriteLine($"Los divisores de {numero} son:");

        for (int i = 1; i <= Math.Abs(numero); i++) // Usamos Math.Abs para manejar números negativos
        {
            if (numero % i == 0) // Si el residuo es 0, es un divisor
            {
                Console.WriteLine(i);
            }
        }
    }
} */

// 13
/* int a =10;
int b = 1;
if ((b != 0) & (a / b > 5)) Console.WriteLine(a / b); */
// el operador "&" evalúa ambas condiciones SIEMPRE, incluso si la primera (b != 0) es false.
// si b = 0, la expresión a / b intentará ejecutar una división por cero, lo que generará una excepción DivideByZeroException.

// Solución correcta
/* if ((b != 0) && (a / b > 5)) 
{
    Console.WriteLine(a / b);
} */

// 14
/* class Program
{
    static void Main()
    {
        int a = 5, b = 10;

        // Usamos el operador ternario para encontrar el menor valor
        int menor = (a < b) ? a : b;
        // si a es menor que b, se asigna a como menor, sino se asigna b como menor.

        Console.WriteLine($"El menor valor entre {a} y {b} es: {menor}");
    }
} */

// 15
/* int i = 0;
for (int i = 1; i <= 10;) {
	Console.WriteLine(i++);
} */
// se declara int i fuera del for, y luego dentro, lo cual no está permitido porque ambas variables están en el mismo alcance. Se puede solucionar simplemente inicializando antes y usándola dentro de la estructura o declarándola dentro de la condición del for y no afuera (declarar dentro O fuera pero no ambas).

// 16
/* int i = 1;
if (--i == 0) {
    Console.WriteLine("cero");
}
if (i++ == 0) {
    Console.WriteLine("cero");
}
Console.WriteLine(i); */
// Primero imprime 0 ya que resta -1 a i y evalúa la condición, segundo evalúa i == 0 e imprime 0 ya que primero evalúa y después suma 1 a i, y por último imprime 1 ya que es el valor final de i.
