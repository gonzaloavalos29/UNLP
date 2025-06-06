namespace teoria8.Ej3;
class Ingresador
{
    // Evento que notifica cuando se ingresa una línea
    public event Action? LineaIngresada;

    public void Ingresar()
    {
        string st = Console.ReadLine() ?? "";
        while (st != "")
        {
            LineaIngresada?.Invoke(); // Disparo del evento
            st = Console.ReadLine() ?? "";
        }
    }
}
