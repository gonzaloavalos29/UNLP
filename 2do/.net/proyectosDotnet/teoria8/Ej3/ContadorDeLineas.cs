using teoria8.Ej3;
namespace teoria8.Ej3;

class ContadorDeLineas
{
    private int _cantLineas = 0;

    public void Contar()
    {
        Ingresador ingresador = new Ingresador();
        ingresador.LineaIngresada += UnaLineaMas; // Suscripción al evento
        ingresador.Ingresar();
        Console.WriteLine($"Cantidad de líneas ingresadas: {_cantLineas}");
    }

    private void UnaLineaMas()
    {
        _cantLineas++;
    }
}
