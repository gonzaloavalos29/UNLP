interface IAlquilable
{
    void SeAlquilaA(Persona p);
    void EsDevueltaPor(Persona p);
}

interface IVendible
{
    void SeVendeA(Persona p);
}

interface ILavable
{
    void Lavar();
    void Secar();
}

interface IReciclable
{
    void Reciclar();
}

interface IAtendible
{
    void Atender();
}
