namespace Figuras
{
    public class Rectangulo
    {
        private double _base;
        private double _altura;

        public Rectangulo(double @base, double altura)
        {
            _base = @base;
            _altura = altura;
        }

        public double GetArea()
        {
            return _base * _altura;
        }
    }
}
