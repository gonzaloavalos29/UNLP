/* using teoria8.Ej2; */
/* using teoria8.Ej3; */
using teoria8.Ej4;

class Program
{
    static void Main()
    {
        // 2
        /* Trabajador t1 = new Trabajador();
        t1.Trabajando += (object? sender, EventArgs e) => Console.WriteLine("Se inicio el trabajo");  */
        // 3
        /* ContadorDeLineas contador = new ContadorDeLineas();
        contador.Contar(); */
        // 4
        Ingresador ingresador = new Ingresador();

        ingresador.LineaVaciaIngresada += (sender, e) =>
        {
            Console.WriteLine("Se ingresó una línea en blanco");
        };

        ingresador.NroIngresado += (sender, e) =>
        {
            Console.WriteLine($"Se ingresó el número {e.Valor}");
        };

        ingresador.Ingresar();
    }
}