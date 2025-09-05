namespace ej6 {
    using System;

    public class Ej6 {
        // Variables
        double[,] unaMatriz;
        double[,] otraMatriz;
        double[,] terceraMatriz;
        double[,] cuartaMatriz;
        double[,] quintaMatriz;

        public Ej6() {
            unaMatriz = new double[,] {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
            otraMatriz = new double[,] {{9, 8, 7}, {6, 5, 4}, {3, 2, 1}};
            terceraMatriz = new double[,] {{6, 6, 5, 4}, {6, 5, 4, 3}, {3, 2, 1, 0}};
            cuartaMatriz = new double[,] {{5, 3, -4, -2}, {8, -1, 0, -3}};
            quintaMatriz = new double[,] {{1, 4, 0}, {-5, 3, 7}, {0, -9, 5}, {5, 1, 4}};
        }

        // Métodos
        double[,]? Suma(double[,] A, double[,] B) {
            int anchoMatriz = A.GetLength(0);
            int largoMatriz = A.GetLength(1);
            double[,]? nuevaMatriz = new double[anchoMatriz, largoMatriz];

            if ((anchoMatriz == B.GetLength(0)) && (largoMatriz == B.GetLength(1))) {
                for (int i = 0; i < anchoMatriz; i++) {
                    for (int j = 0; j < largoMatriz; j++) nuevaMatriz[i, j] = A[i, j] + B[i, j];
                }
            } else nuevaMatriz = null;
            return nuevaMatriz;
        }

        double[,]? Resta(double[,] A, double[,] B) {
            int anchoMatriz = A.GetLength(0);
            int largoMatriz = A.GetLength(1);
            double[,]? nuevaMatriz = new double[anchoMatriz, largoMatriz];

            if ((anchoMatriz == B.GetLength(0)) && (largoMatriz == B.GetLength(1))) {
                for (int i = 0; i < anchoMatriz; i++) {
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

            if (A.GetLength(1) == B.GetLength(0)) {
                for (int i = 0; i < filMatrizA; i++) {
                    for (int j = 0; j < colMatrizB; j++) {
                        double matrizProdElem = 0;
                        for (int k = 0; k < matrizProdDim; k++) matrizProdElem += A[i, k] * B[k, j];
                        matrizProd[i, j] = matrizProdElem;
                    }
                }
            } else throw new Exception("Las dimensiones no son compatibles para la multiplicación.");
            return matrizProd;
        }

        void imprimirMatriz(double[,] matriz) {
            for (int i = 0; i < matriz.GetLength(0); i++) {
                for (int j = 0; j < matriz.GetLength(1); j++) Console.Write("(" + matriz[i, j] + ") ");
                Console.WriteLine();
            }
        }

        public static void Main(string[] args) {
            Ej6 programa = new Ej6();

            double[,]? sumaMatricial = programa.Suma(programa.unaMatriz, programa.otraMatriz);
            double[,]? restaMatricial = programa.Resta(programa.terceraMatriz, programa.terceraMatriz);
            double[,] productoMatricial = programa.Multiplicacion(programa.cuartaMatriz, programa.quintaMatriz);

            if (sumaMatricial != null) programa.imprimirMatriz(sumaMatricial);
            Console.WriteLine();
            if (restaMatricial != null) programa.imprimirMatriz(restaMatricial);
            Console.WriteLine();
            programa.imprimirMatriz(productoMatricial);
        }
    }
}
