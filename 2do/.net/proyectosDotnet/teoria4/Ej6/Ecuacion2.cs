using System;

public class Ecuacion2 {
    private double a;
    private double b;
    private double c;

    // Constructor (única forma de establecer valores)
    public Ecuacion2(double a, double b, double c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    // Devuelve el discriminante
    public double GetDiscriminante() {
        return (b * b) - 4 * a * c;
    }

    // Devuelve cantidad de raíces reales
    public int GetCantidadDeRaices() {
        double discriminante = GetDiscriminante();

        if (discriminante < 0)
            return 0;
        else if (discriminante == 0)
            return 1;
        else
            return 2;
    }

    // Imprime las raíces reales (si las hay)
    public void ImprimirRaices() {
        double discriminante = GetDiscriminante();

        if (discriminante < 0) {
            Console.WriteLine("La ecuación no tiene raíces reales.");
        }
        else if (discriminante == 0) {
            double raiz = -b / (2 * a);
            Console.WriteLine($"La ecuación tiene una única raíz real: {raiz}");
        }
        else {
            double raiz1 = (-b + Math.Sqrt(discriminante)) / (2 * a);
            double raiz2 = (-b - Math.Sqrt(discriminante)) / (2 * a);
            Console.WriteLine($"La ecuación tiene dos raíces reales: {raiz1} y {raiz2}");
        }
    }
}
