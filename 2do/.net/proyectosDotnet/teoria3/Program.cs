using System;
using ej6;
// 2
/* class Program
{
    static void Main(string[] args)
    {
        int[,] matriz = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        ImprimirMatriz(matriz);
    }

    static void ImprimirMatriz(int[,] matriz)
    {
        int filas = matriz.GetLength(0);
        int columnas = matriz.GetLength(1);

        for (int i = 0; i < filas; i++)
        {
            for (int j = 0; j < columnas; j++)
            {
                Console.Write(matriz[i, j] + " ");
            }
            Console.WriteLine(); // Salto de línea al final de cada fila
        }
    }
} */

// 3
//Variables
/* double[,] miMatriz = {{1, 2, 3, 0}, //Esta es cuadrada
                      {4, 5, 6, 0},
                      {7, 8, 9, 0},
                      {10, 11, 12, 0}};
double[,] miOtraMatriz = {{1, 2, 3, 4}, //Esta NO es cuadrada
                          {5, 6, 7, 8},
                          {9, 10, 11, 12}};
double[] miVector;
double[] miOtroVector;

// 4
// Manejo de excepciones para la primera matriz
try {
    miVector = GetDiagonalPrincipal(miMatriz);
    imprimirVector(miVector);
    miVector = GetDiagonalSecundaria(miMatriz);
    imprimirVector(miVector);
}
catch (Exception e) {
    Console.WriteLine(e.Message + ": Se requiere una matriz cuadrada");
}
//Manejo de excepciones para la segunda matriz
try {
    miOtroVector = GetDiagonalPrincipal(miOtraMatriz);
    imprimirVector(miOtroVector);
    miOtroVector = GetDiagonalSecundaria(miOtraMatriz);
    imprimirVector(miOtroVector);
}
catch (Exception e) {
    Console.WriteLine(e.Message + ": Se requiere una matriz cuadrada");
}
double[] GetDiagonalPrincipal(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[] vectorDiagonal = new double[matrizAncho];

    //Revisar si la matriz es cuadrada...
    if (matrizAncho == matrizLargo) {
        //Recorrer la matriz y generar un nuevo vector
        for (int i = 0; i < matrizAncho; i++) vectorDiagonal[i] = matriz[i, i];
    } else {
        throw new Exception("ArgumentException");
    }

    return vectorDiagonal;
}
double[] GetDiagonalSecundaria(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[] vectorDiagonal = new double[matrizAncho];

    //Revisar si la matriz es cuadrada...
    if (matrizAncho == matrizLargo) {
        //Recorrer la matriz, desde "abajo", y generar un nuevo vector
        for (int i = 0; i < matrizAncho; i++) vectorDiagonal[i] = matriz[matrizAncho - 1 - i, i];
    } else {
        throw new Exception("ArgumentException");
    }

    return vectorDiagonal;
}
void imprimirVector(double[] vector) {
    for (int i = 0; i < vector.Length; i++) {
        Console.Write(vector[i].ToString() + " ");
    }
    Console.WriteLine();
} */

// 5
//Variables
/* double[,] miMatriz = {{1, 2, 3}, //Esta es cuadrada
                      {4, 5, 6},
                      {7, 8, 9}};
double[,] miOtraMatriz = {{1, 2, 3, 4}, //Esta NO es cuadrada
                          {5, 6, 7, 8},
                          {9, 0, 0, 0}};
double[,] miTerceraMatriz = {{1, 2}, //Rectangular
                             {2, 3},
                             {3, 2},
                             {2, 1}};

//Programa principal
double[][] miArregloDoble = GetArregloDeArreglo(miMatriz);
double[][] miOtroArregloDoble = GetArregloDeArreglo(miTerceraMatriz);
imprimirArregloDoble(miArregloDoble);
Console.WriteLine();
imprimirArregloDoble(miOtroArregloDoble);

//Métodos
double[][] GetArregloDeArreglo(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[][] arregloDeArreglo = new double[matrizAncho][];

    //Generar arreglo de arreglos
    for (int i = 0; i < matrizAncho; i++) {
        arregloDeArreglo[i] = new double[matrizLargo];
    }

    //Llenar arreglo de arreglos
    for (int i = 0; i < matrizAncho; i++) {
        for (int j = 0; j < matrizLargo; j++) arregloDeArreglo[i][j] = matriz[i, j];
    }

    return arregloDeArreglo;
}

void imprimirArregloDoble(double[][] arregloDoble) {
    for (int i = 0; i < arregloDoble.Length; i++) {
        for (int j = 0; j < arregloDoble[i].Length; j++) Console.Write("(" + i.ToString() + ", " + j.ToString() + ") = " + arregloDoble[i][j] + " ");
        Console.WriteLine();
    }
} */

// 6
//Variables

/* double[,] unaMatriz = {{1, 2, 3},
                       {4, 5, 6},
                       {7, 8, 9}};

double[,] otraMatriz = {{9, 8, 7},
                        {6, 5, 4},
                        {3, 2, 1}};

double[,] terceraMatriz = {{6, 6, 5, 4},
                          {6, 5, 4, 3},
                          {3, 2, 1, 0}};

double[,] cuartaMatriz = {{5, 3, -4, -2},
                          {8, -1, 0, -3}};

double[,] quintaMatriz = {{1, 4, 0},
                          {-5, 3, 7},
                          {0, -9, 5},
                          {5, 1, 4}};

double[,]? sumaMatricial = Suma(unaMatriz, otraMatriz);
double[,]? restaMatricial = Resta(terceraMatriz, terceraMatriz);
double[,] productoMatricial = Multiplicacion(cuartaMatriz, quintaMatriz);

//Programa principal
if (sumaMatricial != null) imprimirMatriz(sumaMatricial);
Console.WriteLine();
if (restaMatricial != null) imprimirMatriz(restaMatricial);
Console.WriteLine();
imprimirMatriz(productoMatricial);

//Métodos
double[,]? Suma(double[,] A, double[,] B) {
    int anchoMatriz = A.GetLength(0);
    int largoMatriz = A.GetLength(1);
    double[,]? nuevaMatriz = new double[anchoMatriz, largoMatriz];

    if ((anchoMatriz == B.GetLength(0)) & (largoMatriz == B.GetLength(1))) {
        //Recorrer la matriz
        for (int i = 0; i < anchoMatriz; i++) {
            //Sumar los elementos de ambas matrices
            for (int j = 0; j < largoMatriz; j++) nuevaMatriz[i, j] = A[i, j] + B[i, j];
        }
    } else nuevaMatriz = null;
    return nuevaMatriz;
}

double[,]? Resta(double[,] A, double[,] B) {
    int anchoMatriz = A.GetLength(0);
    int largoMatriz = A.GetLength(1);
    double[,]? nuevaMatriz = new double[anchoMatriz, largoMatriz];

    if ((anchoMatriz == B.GetLength(0)) & (largoMatriz == B.GetLength(1))) {
        //Recorrer la matriz
        for (int i = 0; i < anchoMatriz; i++) {
            //Sumar los elementos de ambas matrices
            for (int j = 0; j < largoMatriz; j++) nuevaMatriz[i, j] = A[i, j] - B[i, j];
        }
    } else nuevaMatriz = null;
    return nuevaMatriz;
}

double[,] Multiplicacion(double[,] A, double[,] B) {
    int filMatrizA = A.GetLength(0);
    int colMatrizB = B.GetLength(1);
    int matrizProdDim = A.GetLength(1);
    double[,] matrizProd = new double[filMatrizA, colMatrizB];
    double matrizProdElem;

    //Comparar la cantidad de columnas de A con la cantidad de filas de B
    if (A.GetLength(1) == B.GetLength(0)) {
        for (int i = 0; i < filMatrizA; i++) {
            for (int j = 0; j < colMatrizB; j++) {
                matrizProdElem = 0;
                for (int k = 0; k < matrizProdDim; k++) matrizProdElem += A[i, k] * B[k, j];
                matrizProd[i, j] = matrizProdElem;
            }
        }
    } else throw new Exception("ArgumentException");

    return matrizProd;
}

void imprimirMatriz(double[,] matriz) {
    for (int i = 0; i < matriz.GetLength(0); i++) {
        for (int j = 0; j < matriz.GetLength(1); j++) Console.Write("(" + matriz[i, j] + ") ");
        Console.WriteLine();
    }
} */

// 7
// 7) System.Double, System.Single, System.Single