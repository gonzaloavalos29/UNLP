namespace teoria5;

public class Cuenta3
{
    //Variables de instancia
    private int _id;
    private int _saldo = 0;

    //Campos estáticos
    private static int s_extraccionesFallidas = 0;
    private static int s_operacionesDeposito = 0;
    private static int s_operacionesExtracciones = 0;
    private static int s_numId = 0;
    private static int s_totalDepositado = 0;
    private static int s_totalExtraido = 0;
    private static int s_totalSaldo = 0;
    private readonly static List<Cuenta3> s_listaCuentas = new List<Cuenta3>();

    // Propiedad estática de sólo lectura
    public static List<Cuenta3> Cuentas
    {
        get { return new List<Cuenta3>(s_listaCuentas); }
    }

    //Método constructor
    public Cuenta3()
    {
        _id = ++s_numId;
        Console.WriteLine($"Se creó la cuenta Id={_id}");
        s_listaCuentas.Add(this);
    }

    //Métodos de instancia
    public Cuenta3 Depositar(int suma)
    {
        _saldo += suma;
        Console.WriteLine($"Se depositó {suma} en la cuenta {_id} (Saldo={_saldo})");
        s_totalDepositado += suma;
        s_totalSaldo += suma;
        s_operacionesDeposito++;
        return this;
    }

    public Cuenta3 Extraer(int suma)
    {
        if (_saldo - suma >= 0)
        {
            _saldo -= suma;
            Console.WriteLine($"Se extrajo {suma} de la cuenta {_id} (Saldo={_saldo})");
            s_totalExtraido += suma;
            s_totalSaldo -= suma;
            s_operacionesExtracciones++;
        }
        else
        {
            s_extraccionesFallidas++;
            Console.WriteLine("Operación denegada - Saldo insuficiente");
        }
        return this;
    }

    //Métodos estáticos
    public static void ImprimirDetalle()
    {
        Console.WriteLine($"CUENTAS CREADAS: {s_numId}");
        Console.WriteLine($"DEPÓSITOS:       {s_operacionesDeposito}     - Total depositado:   {s_totalDepositado}");
        Console.WriteLine($"DEPÓSITOS:       {s_operacionesExtracciones}     - Total extraido:     {s_totalExtraido}");
        Console.WriteLine($"                       - Saldo:              {s_totalSaldo}");
        Console.WriteLine($"  * Se denegaron {s_extraccionesFallidas} extracciones por falta de fondos");
    }

    //❌ Este método debe eliminarse
    // public static List<Cuenta> GetCuentas() {
    //     return new List<Cuenta>(s_listaCuentas);
    // }

    // (Opcional) Método ToString para representar la cuenta al imprimirla
    public override string ToString() {
        return $"Cuenta {_id} - Saldo: {_saldo}";
    }
}
