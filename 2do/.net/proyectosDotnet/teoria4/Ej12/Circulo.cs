using System;

namespace Figuras
{
    public class Circulo
    {
        private double _radio;

        public Circulo(double radio)
        {
            _radio = radio;
        }

        public double GetArea()
        {
            return Math.PI * _radio * _radio;
        }
    }
}
