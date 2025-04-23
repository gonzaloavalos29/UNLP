/* using System;

public class Ej7 {
    public static void Main() {
        double[,] datos1 = {
            { 1, 2, 3 },
            { 4, 5, 6 }
        };

        double[,] datos2 = {
            { 7, 8, 9 },
            { 10, 11, 12 }
        };

        Matriz m1 = new Matriz(datos1);
        Matriz m2 = new Matriz(datos2);

        Console.WriteLine("Matriz m1:");
        m1.imprimir();

        Console.WriteLine("\nMatriz m2:");
        m2.imprimir();

        Console.WriteLine("\nSuma (m1 + m2):");
        Matriz suma = new Matriz(datos1);
        suma.sumarle(m2);
        suma.imprimir();

        Console.WriteLine("\nResta (m1 - m2):");
        Matriz resta = new Matriz(datos1);
        resta.restarle(m2);
        resta.imprimir();

        Console.WriteLine("\nMultiplicación (m1 * m3):");
        double[,] datos3 = {
            { 1, 2 },
            { 3, 4 },
            { 5, 6 }
        };
        Matriz m3 = new Matriz(datos3);
        Matriz producto = new Matriz(datos1); // 2x3 * 3x2 = 2x2
        producto.multiplicarPor(m3);
        producto.imprimir();

        Console.WriteLine("\nFila 1 de m1:");
        ImprimirVector(m1.GetFila(1));

        Console.WriteLine("\nColumna 2 de m1:");
        ImprimirVector(m1.GetColumna(2));

        Console.WriteLine("\nDiagonal principal de matriz cuadrada:");
        double[,] cuadrada = {
            { 1, 2, 3 },
            { 4, 5, 6 },
            { 7, 8, 9 }
        };
        Matriz mc = new Matriz(cuadrada);
        ImprimirVector(mc.GetDiagonalPrincipal());

        Console.WriteLine("\nDiagonal secundaria de matriz cuadrada:");
        ImprimirVector(mc.GetDiagonalSecundaria());

        Console.WriteLine("\nMatriz como arreglo de arreglos:");
        double[][] arreglo = mc.getArregloDeArreglo();
        foreach (var fila in arreglo)
        {
            ImprimirVector(fila);
        }
    }

    public static void ImprimirVector(double[] vector) {
        Console.WriteLine(string.Join(", ", vector));
    }
}
 */