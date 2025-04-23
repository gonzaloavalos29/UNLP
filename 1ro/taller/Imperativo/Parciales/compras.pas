program parcialCompras;
const
    fin = 0;
    maxMes = 12;
type
    subr = 0..maxMes;
    compra = record
      cliente: integer;
      factura: integer;
      mes: subr;
      monto: real;
    end;

    vectorMontos = array[subr] of real;

    compra2 = record
        cliente: integer;
        vector: vectorMontos;
    end;

    arbol = ^nodo;
    nodo = record
        dato: compra2;
        HI: arbol;
        HD: arbol;
    end;

procedure leerCompra(var c: compra);
begin
    write('Ingrese un codigo de cliente (ingrese 0 para finalizar): '); readln(c.cliente);
    if (c.cliente <> fin) then begin
        write('Ingrese factura: '); readln(c.factura);
        write('Ingrese mes: '); readln(c.mes);
        write('Ingrese monto gastado: '); readln(c.monto);
    end;
end;

procedure cargarHoja(var a: arbol; c: compra);
begin
    if (a = nil) then begin
        new(a);
        a^.dato.cliente:= c.cliente;
        a^.dato.vector[c.mes]:= c.monto;
        a^.HI:= nil;
        a^.HD:= nil;
    end else if (c.cliente < a^.dato.cliente) then
        cargarHoja(a^.HI, c)
    else if (c.cliente > a^.dato.cliente) then  
        cargarHoja(a^.HD, c)
    else 
        a^.dato.vector[c.mes]:= a^.dato.vector[c.mes] + c.monto;
end;

procedure cargarArbol(var a: arbol);
var 
    c: compra;
begin
    leerCompra(c);
    while (c.cliente <> fin) do begin
        cargarHoja(a, c);
        leerCompra(c);
    end;
end;

procedure imprimirVector(v: vectorMontos);
var 
    i: integer;
begin
    for i:= 1 to maxMes do
        writeln('Mes: ', i, ' | Monto: ', v[i]:0:2)
end;

procedure imprimirArbol(a: arbol);
begin   
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('Cliente: ', a^.dato.cliente);
        imprimirVector(a^.dato.vector);
        imprimirArbol(a^.HD);
    end;
end;

procedure mayorGastoClienteVector(v: vectorMontos; var mesMax: subr; var maxMonto: real);
var
    i: integer;
begin
    for i:= 1 to maxMes do begin
        if (v[i] > maxMonto) then begin
            maxMonto:= v[i];
            mesMax:= i;
        end;
    end;
end;

procedure mayorGastoCliente(a: arbol; cliente: integer; var mesMax: subr; var maxMonto: real);
begin
    if (a <> nil) then begin
        if (cliente < a^.dato.cliente) then
            mayorGastoCliente(a^.HD, cliente, mesMax, maxMonto)
        else if (cliente > a^.dato.cliente) then    
            mayorGastoCliente(a^.HI, cliente, mesMax, maxMonto)
        else
            mayorGastoClienteVector(a^.dato.vector, mesMax, maxMonto);
    end;
end;

VAR
    a: arbol;
    mesMax: subr;
    maxMonto: real;
    cliente: integer;
BEGIN 
    mesMax:= 0; maxMonto:= -1;
    a:= nil;
    cargarArbol(a);
    imprimirArbol(a);
    write('Ingrese un numero de cliente para buscar el mes en el que mayor gasto tuvo: '); readln(cliente);
    mayorGastoCliente(a, cliente, mesMax, maxMonto);
    write('El cliente ', cliente, ' tuvo en el mes ', mesMax, ' un gasto maximo de: ', maxMonto:0:2);
END.
