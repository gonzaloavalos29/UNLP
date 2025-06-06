namespace teoria8;
/* class Trabajador {
    public EventHandler? trabajando; // no es necesario definir un tipo delegado propio
                                     // porque la plataforma provee el tipo EventHandler
                                     // que se adecua a lo que se necesita
    public void Trabajar() {
        Trabajando(this, EventArgs.Empty);
        // realiza algún trabajo
        Console.Writeline("Trabajado concluido");
    }
} */
class Trabajador
{
    private EventHandler? _trabajando; // no es necesario definir un tipo delegado propio
                                       // porque la plataforma provee el tipo EventHandler
                                       // que se adecua a lo que se necesita
    public event EventHandler? Trabajando
    {
        add
        {
            _trabajando += value;
            Trabajar();
        }
        remove
        {
        }
    }
    public void Trabajar()
    {
        _trabajando?.Invoke(this, EventArgs.Empty);
        // realiza algún trabajo
        Console.WriteLine("Trabajado concluido");
    }
}