using AL.Aplicacion.Interfaces;

namespace AL.Aplicacion.UseCases;

// base de las clases para los usecases relacionados a los clientes
public abstract class ClienteUseCase(IRepositorioCliente repositorio)
{
    protected IRepositorioCliente Repositorio { get; } = repositorio;
}