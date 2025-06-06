namespace teoria8.Ej4;
class ValorEventArgs : EventArgs
{
    public int Valor { get; }

    public ValorEventArgs(int valor)
    {
        Valor = valor;
    }
}
