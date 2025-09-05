using System;

public class Matriz {
    private double[,] datos;

    // Constructor por dimensiones
    public Matriz(int filas, int columnas) {
        datos = new double[filas, columnas];
    }

    // Constructor por arreglo bidimensional
    public Matriz(double[,] matriz) {
        int filas = matriz.GetLength(0);
        int columnas = matriz.GetLength(1);
        datos = new double[filas, columnas];
        Array.Copy(matriz, datos, matriz.Length);
    }

    public void SetElemento(int fila, int columna, double elemento) {
        datos[fila, columna] = elemento;
    }

    public double GetElemento(int fila, int columna) {
        return datos[fila, columna];
    }

    public void imprimir() {
        imprimir("0.##");
    }

    public void imprimir(string formatString) {
        int filas = datos.GetLength(0);
        int columnas = datos.GetLength(1);
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                Console.Write(datos[i, j].ToString(formatString) + "\t");
            }
            Console.WriteLine();
        }
    }

    public double[] GetFila(int fila)
    {
        int columnas = datos.GetLength(1);
        double[] filaDatos = new double[columnas];
        for (int j = 0; j < columnas; j++) {
            filaDatos[j] = datos[fila, j];
        }
        return filaDatos;
    }

    public double[] GetColumna(int columna) {
        int filas = datos.GetLength(0);
        double[] columnaDatos = new double[filas];
        for (int i = 0; i < filas; i++) {
            columnaDatos[i] = datos[i, columna];
        }
        return columnaDatos;
    }

    public double[] GetDiagonalPrincipal() {
        int n = Math.Min(datos.GetLength(0), datos.GetLength(1));
        double[] diagonal = new double[n];
        for (int i = 0; i < n; i++) {
            diagonal[i] = datos[i, i];
        }
        return diagonal;
    }

    public double[] GetDiagonalSecundaria() {
        int filas = datos.GetLength(0);
        int columnas = datos.GetLength(1);
        int n = Math.Min(filas, columnas);
        double[] diagonal = new double[n];
        for (int i = 0; i < n; i++)
        {
            diagonal[i] = datos[i, columnas - i - 1];
        }
        return diagonal;
    }

    public double[][] getArregloDeArreglo() {
        int filas = datos.GetLength(0);
        int columnas = datos.GetLength(1);
        double[][] arreglo = new double[filas][];
        for (int i = 0; i < filas; i++) {
            arreglo[i] = new double[columnas];
            for (int j = 0; j < columnas; j++) {
                arreglo[i][j] = datos[i, j];
            }
        }
        return arreglo;
    }

    public void sumarle(Matriz m) {
        if (!MismasDimensiones(m))
            throw new ArgumentException("Las matrices deben tener las mismas dimensiones para sumar.");
        int filas = datos.GetLength(0);
        int columnas = datos.GetLength(1);
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                datos[i, j] += m.datos[i, j];
            }
        }
    }

    public void restarle(Matriz m) {
        if (!MismasDimensiones(m))
            throw new ArgumentException("Las matrices deben tener las mismas dimensiones para restar.");
        int filas = datos.GetLength(0);
        int columnas = datos.GetLength(1);
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                datos[i, j] -= m.datos[i, j];
            }
        }
    }

    public void multiplicarPor(Matriz m) {
        int filasA = datos.GetLength(0);
        int columnasA = datos.GetLength(1);
        int filasB = m.datos.GetLength(0);
        int columnasB = m.datos.GetLength(1);

        if (columnasA != filasB)
            throw new ArgumentException("Cantidad de columnas de A debe ser igual a cantidad de filas de B.");
        double[,] resultado = new double[filasA, columnasB];

        for (int i = 0; i < filasA; i++) {
            for (int j = 0; j < columnasB; j++) {
                for (int k = 0; k < columnasA; k++)
                {
                    resultado[i, j] += datos[i, k] * m.datos[k, j];
                }
            }
        }
        datos = resultado;
    }

    private bool MismasDimensiones(Matriz m) {
        return datos.GetLength(0) == m.datos.GetLength(0) &&
               datos.GetLength(1) == m.datos.GetLength(1);
    }
}
