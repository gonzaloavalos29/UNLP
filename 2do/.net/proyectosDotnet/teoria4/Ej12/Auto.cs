namespace Automotores
{
    public class Auto
    {
        private string _marca;
        private int _anio;

        // Constructor completo
        public Auto(string marca, int anio)
        {
            _marca = marca;
            _anio = anio;
        }

        // Constructor con sólo marca: año por defecto 2022
        public Auto(string marca) : this(marca, 2022)
        {
        }

        public string GetDescripcion()
        {
            return $"Auto {_marca} {_anio}";
        }
    }
}
