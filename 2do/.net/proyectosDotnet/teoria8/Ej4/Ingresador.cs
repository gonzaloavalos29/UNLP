using System;
namespace teoria8.Ej4;

class Ingresador
{
    // Evento para línea vacía
    public event EventHandler? LineaVaciaIngresada;

    // Evento para número ingresado
    public event EventHandler<ValorEventArgs>? NroIngresado;

    public void Ingresar()
    {
        string linea;
        do
        {
            linea = Console.ReadLine() ?? "";

            if (linea == "")
            {
                LineaVaciaIngresada?.Invoke(this, EventArgs.Empty);
            }
            else if (int.TryParse(linea, out int valor))
            {
                NroIngresado?.Invoke(this, new ValorEventArgs(valor));
            }

        } while (linea != "fin");
    }
}
