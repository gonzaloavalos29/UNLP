using System;
using System.Collections.Generic;
using Figuras;
using Automotores;

namespace Aplicacion
{
    class Program
    {
        static void Main()
        {
            // Circulos
            List<Circulo> listaCirculos = new List<Circulo>
            {
                new Circulo(1.1),
                new Circulo(3),
                new Circulo(3.2)
            };

            // Rectangulos
            List<Rectangulo> listaRectangulos = new List<Rectangulo>
            {
                new Rectangulo(3, 4),
                new Rectangulo(4.3, 4.4)
            };

            // Autos
            List<Auto> listaAutos = new List<Auto>
            {
                new Auto("Nissan", 2017),
                new Auto("Ford", 2015),
                new Auto("Renault")          // usará año 2022 por defecto
            };

            // Imprimir áreas de círculos
            foreach (Circulo c in listaCirculos)
            {
                Console.WriteLine($"Área del círculo {c.GetArea()}");
            }

            // Imprimir áreas de rectángulos
            foreach (Rectangulo r in listaRectangulos)
            {
                Console.WriteLine($"Área del rectángulo {r.GetArea()}");
            }

            // Imprimir descripción de autos
            foreach (Auto a in listaAutos)
            {
                Console.WriteLine(a.GetDescripcion());
            }
        }
    }
}
